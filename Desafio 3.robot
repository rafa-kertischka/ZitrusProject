*** Settings ***
Documentation     Test cases for GitHub API
Library           RequestsLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BASE_URL}       https://api.github.com
${USERNAME}       your_username
${PASSWORD}       your_password
${REPO_NAME}      test-repo
${ISSUE_TITLE}    Test Issue
${TOKEN}          your_token

*** Test Cases ***
Create Repository on GitHub
    [Documentation]    Create a new repository on GitHub
    ${headers}=    Create Dictionary    Authorization=token ${TOKEN}
    ${data}=    Create Dictionary    name=${REPO_NAME}
    ${response}=    Post Request    ${BASE_URL}/user/repos    headers=${headers}    json=${data}
    Should Be Equal As Strings    ${response.status_code}    201
    ${repo_id}=    Set Variable    ${response.json()["id"]}
    Set Suite Variable    ${REPO_ID}    ${repo_id}

Query Repository
    [Documentation]    Query the repository created on GitHub
    ${headers}=    Create Dictionary    Authorization=token ${TOKEN}
    ${response}=    Get Request    ${BASE_URL}/repos/${USERNAME}/${REPO_NAME}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

Create Issue
    [Documentation]    Create an issue on the repository
    ${headers}=    Create Dictionary    Authorization=token ${TOKEN}
    ${data}=    Create Dictionary    title=${ISSUE_TITLE}
    ${response}=    Post Request    ${BASE_URL}/repos/${USERNAME}/${REPO_NAME}/issues    headers=${headers}    json=${data}
    Should Be Equal As Strings    ${response.status_code}    201
    ${issue_id}=    Set Variable    ${response.json()["id"]}
    Set Suite Variable    ${ISSUE_ID}    ${issue_id}

Query Issue
    [Documentation]    Query the issue created on the repository
    ${headers}=    Create Dictionary    Authorization=token ${TOKEN}
    ${response}=    Get Request    ${BASE_URL}/repos/${USERNAME}/${REPO_NAME}/issues/${ISSUE_ID}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

Delete Repository
    [Documentation]    Delete the repository created on GitHub
    ${headers}=    Create Dictionary    Authorization=token ${TOKEN}
    ${response}=    Delete Request    ${BASE_URL}/repos/${USERNAME}/${REPO_NAME}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    204

Query Deleted Repository
    [Documentation]    Query if the repository has been deleted
    ${headers}=    Create Dictionary    Authorization=token ${TOKEN}
    ${response}=    Get Request    ${BASE_URL}/repos/${USERNAME}/${REPO_NAME}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    404