// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let issues = try Issues(json)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Issue
public struct Issue: Codable, Equatable {
    public let id: Int
    public let nodeID: String
    public let url, repositoryURL: String
    public let labelsURL: String
    public let commentsURL, eventsURL, htmlURL: String
    public let number: Int
    public let state, title, body: String
    public let user: Assignee
    public let labels: [Label]
    public let assignee: Assignee
    public let assignees: [Assignee]
    public let milestone: Milestone
    public let locked: Bool
    public let activeLockReason: String
    public let comments: Int
    public let pullRequest: PullRequest
    public let closedAt: JSONNull?
    public let createdAt, updatedAt: Date
    public let repository: Repository
    public let authorAssociation: String

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case number, state, title, body, user, labels, assignee, assignees, milestone, locked
        case activeLockReason = "active_lock_reason"
        case comments
        case pullRequest = "pull_request"
        case closedAt = "closed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case repository
        case authorAssociation = "author_association"
    }

    public init(id: Int, nodeID: String, url: String, repositoryURL: String, labelsURL: String, commentsURL: String, eventsURL: String, htmlURL: String, number: Int, state: String, title: String, body: String, user: Assignee, labels: [Label], assignee: Assignee, assignees: [Assignee], milestone: Milestone, locked: Bool, activeLockReason: String, comments: Int, pullRequest: PullRequest, closedAt: JSONNull?, createdAt: Date, updatedAt: Date, repository: Repository, authorAssociation: String) {
        self.id = id
        self.nodeID = nodeID
        self.url = url
        self.repositoryURL = repositoryURL
        self.labelsURL = labelsURL
        self.commentsURL = commentsURL
        self.eventsURL = eventsURL
        self.htmlURL = htmlURL
        self.number = number
        self.state = state
        self.title = title
        self.body = body
        self.user = user
        self.labels = labels
        self.assignee = assignee
        self.assignees = assignees
        self.milestone = milestone
        self.locked = locked
        self.activeLockReason = activeLockReason
        self.comments = comments
        self.pullRequest = pullRequest
        self.closedAt = closedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.repository = repository
        self.authorAssociation = authorAssociation
    }
}

// MARK: Issue convenience initializers and mutators

public extension Issue {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Issue.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        nodeID: String? = nil,
        url: String? = nil,
        repositoryURL: String? = nil,
        labelsURL: String? = nil,
        commentsURL: String? = nil,
        eventsURL: String? = nil,
        htmlURL: String? = nil,
        number: Int? = nil,
        state: String? = nil,
        title: String? = nil,
        body: String? = nil,
        user: Assignee? = nil,
        labels: [Label]? = nil,
        assignee: Assignee? = nil,
        assignees: [Assignee]? = nil,
        milestone: Milestone? = nil,
        locked: Bool? = nil,
        activeLockReason: String? = nil,
        comments: Int? = nil,
        pullRequest: PullRequest? = nil,
        closedAt: JSONNull?? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        repository: Repository? = nil,
        authorAssociation: String? = nil
    ) -> Issue {
        return Issue(
            id: id ?? self.id,
            nodeID: nodeID ?? self.nodeID,
            url: url ?? self.url,
            repositoryURL: repositoryURL ?? self.repositoryURL,
            labelsURL: labelsURL ?? self.labelsURL,
            commentsURL: commentsURL ?? self.commentsURL,
            eventsURL: eventsURL ?? self.eventsURL,
            htmlURL: htmlURL ?? self.htmlURL,
            number: number ?? self.number,
            state: state ?? self.state,
            title: title ?? self.title,
            body: body ?? self.body,
            user: user ?? self.user,
            labels: labels ?? self.labels,
            assignee: assignee ?? self.assignee,
            assignees: assignees ?? self.assignees,
            milestone: milestone ?? self.milestone,
            locked: locked ?? self.locked,
            activeLockReason: activeLockReason ?? self.activeLockReason,
            comments: comments ?? self.comments,
            pullRequest: pullRequest ?? self.pullRequest,
            closedAt: closedAt ?? self.closedAt,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            repository: repository ?? self.repository,
            authorAssociation: authorAssociation ?? self.authorAssociation
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Assignee
public struct Assignee: Codable, Equatable {
    public let login: String
    public let id: Int
    public let nodeID: String
    public let avatarURL: String
    public let gravatarID: String
    public let url, htmlURL, followersURL: String
    public let followingURL, gistsURL, starredURL: String
    public let subscriptionsURL, organizationsURL, reposURL: String
    public let eventsURL: String
    public let receivedEventsURL: String
    public let type: String
    public let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }

    public init(login: String, id: Int, nodeID: String, avatarURL: String, gravatarID: String, url: String, htmlURL: String, followersURL: String, followingURL: String, gistsURL: String, starredURL: String, subscriptionsURL: String, organizationsURL: String, reposURL: String, eventsURL: String, receivedEventsURL: String, type: String, siteAdmin: Bool) {
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.siteAdmin = siteAdmin
    }
}

// MARK: Assignee convenience initializers and mutators

public extension Assignee {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Assignee.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        login: String? = nil,
        id: Int? = nil,
        nodeID: String? = nil,
        avatarURL: String? = nil,
        gravatarID: String? = nil,
        url: String? = nil,
        htmlURL: String? = nil,
        followersURL: String? = nil,
        followingURL: String? = nil,
        gistsURL: String? = nil,
        starredURL: String? = nil,
        subscriptionsURL: String? = nil,
        organizationsURL: String? = nil,
        reposURL: String? = nil,
        eventsURL: String? = nil,
        receivedEventsURL: String? = nil,
        type: String? = nil,
        siteAdmin: Bool? = nil
    ) -> Assignee {
        return Assignee(
            login: login ?? self.login,
            id: id ?? self.id,
            nodeID: nodeID ?? self.nodeID,
            avatarURL: avatarURL ?? self.avatarURL,
            gravatarID: gravatarID ?? self.gravatarID,
            url: url ?? self.url,
            htmlURL: htmlURL ?? self.htmlURL,
            followersURL: followersURL ?? self.followersURL,
            followingURL: followingURL ?? self.followingURL,
            gistsURL: gistsURL ?? self.gistsURL,
            starredURL: starredURL ?? self.starredURL,
            subscriptionsURL: subscriptionsURL ?? self.subscriptionsURL,
            organizationsURL: organizationsURL ?? self.organizationsURL,
            reposURL: reposURL ?? self.reposURL,
            eventsURL: eventsURL ?? self.eventsURL,
            receivedEventsURL: receivedEventsURL ?? self.receivedEventsURL,
            type: type ?? self.type,
            siteAdmin: siteAdmin ?? self.siteAdmin
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Label
public struct Label: Codable, Equatable {
    public let id: Int
    public let nodeID: String
    public let url: String
    public let name, labelDescription, color: String
    public let labelDefault: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url, name
        case labelDescription = "description"
        case color
        case labelDefault = "default"
    }

    public init(id: Int, nodeID: String, url: String, name: String, labelDescription: String, color: String, labelDefault: Bool) {
        self.id = id
        self.nodeID = nodeID
        self.url = url
        self.name = name
        self.labelDescription = labelDescription
        self.color = color
        self.labelDefault = labelDefault
    }
}

// MARK: Label convenience initializers and mutators

public extension Label {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Label.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        nodeID: String? = nil,
        url: String? = nil,
        name: String? = nil,
        labelDescription: String? = nil,
        color: String? = nil,
        labelDefault: Bool? = nil
    ) -> Label {
        return Label(
            id: id ?? self.id,
            nodeID: nodeID ?? self.nodeID,
            url: url ?? self.url,
            name: name ?? self.name,
            labelDescription: labelDescription ?? self.labelDescription,
            color: color ?? self.color,
            labelDefault: labelDefault ?? self.labelDefault
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Milestone
public struct Milestone: Codable, Equatable {
    public let url: String
    public let htmlURL: String
    public let labelsURL: String
    public let id: Int
    public let nodeID: String
    public let number: Int
    public let state, title, milestoneDescription: String
    public let creator: Assignee
    public let openIssues, closedIssues: Int
    public let createdAt, updatedAt, closedAt, dueOn: Date

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case labelsURL = "labels_url"
        case id
        case nodeID = "node_id"
        case number, state, title
        case milestoneDescription = "description"
        case creator
        case openIssues = "open_issues"
        case closedIssues = "closed_issues"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case dueOn = "due_on"
    }

    public init(url: String, htmlURL: String, labelsURL: String, id: Int, nodeID: String, number: Int, state: String, title: String, milestoneDescription: String, creator: Assignee, openIssues: Int, closedIssues: Int, createdAt: Date, updatedAt: Date, closedAt: Date, dueOn: Date) {
        self.url = url
        self.htmlURL = htmlURL
        self.labelsURL = labelsURL
        self.id = id
        self.nodeID = nodeID
        self.number = number
        self.state = state
        self.title = title
        self.milestoneDescription = milestoneDescription
        self.creator = creator
        self.openIssues = openIssues
        self.closedIssues = closedIssues
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.closedAt = closedAt
        self.dueOn = dueOn
    }
}

// MARK: Milestone convenience initializers and mutators

public extension Milestone {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Milestone.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        url: String? = nil,
        htmlURL: String? = nil,
        labelsURL: String? = nil,
        id: Int? = nil,
        nodeID: String? = nil,
        number: Int? = nil,
        state: String? = nil,
        title: String? = nil,
        milestoneDescription: String? = nil,
        creator: Assignee? = nil,
        openIssues: Int? = nil,
        closedIssues: Int? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        closedAt: Date? = nil,
        dueOn: Date? = nil
    ) -> Milestone {
        return Milestone(
            url: url ?? self.url,
            htmlURL: htmlURL ?? self.htmlURL,
            labelsURL: labelsURL ?? self.labelsURL,
            id: id ?? self.id,
            nodeID: nodeID ?? self.nodeID,
            number: number ?? self.number,
            state: state ?? self.state,
            title: title ?? self.title,
            milestoneDescription: milestoneDescription ?? self.milestoneDescription,
            creator: creator ?? self.creator,
            openIssues: openIssues ?? self.openIssues,
            closedIssues: closedIssues ?? self.closedIssues,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            closedAt: closedAt ?? self.closedAt,
            dueOn: dueOn ?? self.dueOn
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - PullRequest
public struct PullRequest: Codable, Equatable {
    public let url, htmlURL: String
    public let diffURL: String
    public let patchURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }

    public init(url: String, htmlURL: String, diffURL: String, patchURL: String) {
        self.url = url
        self.htmlURL = htmlURL
        self.diffURL = diffURL
        self.patchURL = patchURL
    }
}

// MARK: PullRequest convenience initializers and mutators

public extension PullRequest {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PullRequest.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        url: String? = nil,
        htmlURL: String? = nil,
        diffURL: String? = nil,
        patchURL: String? = nil
    ) -> PullRequest {
        return PullRequest(
            url: url ?? self.url,
            htmlURL: htmlURL ?? self.htmlURL,
            diffURL: diffURL ?? self.diffURL,
            patchURL: patchURL ?? self.patchURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Repository
public struct Repository: Codable, Equatable {
    public let id: Int
    public let nodeID, name, fullName: String
    public let owner: Assignee
    public let repositoryPrivate: Bool
    public let htmlURL: String
    public let repositoryDescription: String
    public let fork: Bool
    public let url: String
    public let archiveURL, assigneesURL, blobsURL, branchesURL: String
    public let collaboratorsURL, commentsURL, commitsURL, compareURL: String
    public let contentsURL: String
    public let contributorsURL, deploymentsURL, downloadsURL, eventsURL: String
    public let forksURL: String
    public let gitCommitsURL, gitRefsURL, gitTagsURL, gitURL: String
    public let issueCommentURL, issueEventsURL, issuesURL, keysURL: String
    public let labelsURL: String
    public let languagesURL, mergesURL: String
    public let milestonesURL, notificationsURL, pullsURL, releasesURL: String
    public let sshURL: String
    public let stargazersURL: String
    public let statusesURL: String
    public let subscribersURL, subscriptionURL, tagsURL, teamsURL: String
    public let treesURL: String
    public let cloneURL: String
    public let mirrorURL: String
    public let hooksURL, svnURL, homepage: String
    public let language: JSONNull?
    public let forksCount, stargazersCount, watchersCount, size: Int
    public let defaultBranch: String
    public let openIssuesCount: Int
    public let isTemplate: Bool
    public let topics: [String]
    public let hasIssues, hasProjects, hasWiki, hasPages: Bool
    public let hasDownloads, archived, disabled: Bool
    public let visibility: String
    public let pushedAt, createdAt, updatedAt: Date
    public let permissions: Permissions
    public let allowRebaseMerge: Bool
    public let templateRepository: JSONNull?
    public let tempCloneToken: String
    public let allowSquashMerge, allowAutoMerge, deleteBranchOnMerge, allowMergeCommit: Bool
    public let subscribersCount, networkCount: Int
    public let license: License
    public let forks, openIssues, watchers: Int

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case repositoryPrivate = "private"
        case htmlURL = "html_url"
        case repositoryDescription = "description"
        case fork, url
        case archiveURL = "archive_url"
        case assigneesURL = "assignees_url"
        case blobsURL = "blobs_url"
        case branchesURL = "branches_url"
        case collaboratorsURL = "collaborators_url"
        case commentsURL = "comments_url"
        case commitsURL = "commits_url"
        case compareURL = "compare_url"
        case contentsURL = "contents_url"
        case contributorsURL = "contributors_url"
        case deploymentsURL = "deployments_url"
        case downloadsURL = "downloads_url"
        case eventsURL = "events_url"
        case forksURL = "forks_url"
        case gitCommitsURL = "git_commits_url"
        case gitRefsURL = "git_refs_url"
        case gitTagsURL = "git_tags_url"
        case gitURL = "git_url"
        case issueCommentURL = "issue_comment_url"
        case issueEventsURL = "issue_events_url"
        case issuesURL = "issues_url"
        case keysURL = "keys_url"
        case labelsURL = "labels_url"
        case languagesURL = "languages_url"
        case mergesURL = "merges_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case pullsURL = "pulls_url"
        case releasesURL = "releases_url"
        case sshURL = "ssh_url"
        case stargazersURL = "stargazers_url"
        case statusesURL = "statuses_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case tagsURL = "tags_url"
        case teamsURL = "teams_url"
        case treesURL = "trees_url"
        case cloneURL = "clone_url"
        case mirrorURL = "mirror_url"
        case hooksURL = "hooks_url"
        case svnURL = "svn_url"
        case homepage, language
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case size
        case defaultBranch = "default_branch"
        case openIssuesCount = "open_issues_count"
        case isTemplate = "is_template"
        case topics
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDownloads = "has_downloads"
        case archived, disabled, visibility
        case pushedAt = "pushed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case permissions
        case allowRebaseMerge = "allow_rebase_merge"
        case templateRepository = "template_repository"
        case tempCloneToken = "temp_clone_token"
        case allowSquashMerge = "allow_squash_merge"
        case allowAutoMerge = "allow_auto_merge"
        case deleteBranchOnMerge = "delete_branch_on_merge"
        case allowMergeCommit = "allow_merge_commit"
        case subscribersCount = "subscribers_count"
        case networkCount = "network_count"
        case license, forks
        case openIssues = "open_issues"
        case watchers
    }

    public init(id: Int, nodeID: String, name: String, fullName: String, owner: Assignee, repositoryPrivate: Bool, htmlURL: String, repositoryDescription: String, fork: Bool, url: String, archiveURL: String, assigneesURL: String, blobsURL: String, branchesURL: String, collaboratorsURL: String, commentsURL: String, commitsURL: String, compareURL: String, contentsURL: String, contributorsURL: String, deploymentsURL: String, downloadsURL: String, eventsURL: String, forksURL: String, gitCommitsURL: String, gitRefsURL: String, gitTagsURL: String, gitURL: String, issueCommentURL: String, issueEventsURL: String, issuesURL: String, keysURL: String, labelsURL: String, languagesURL: String, mergesURL: String, milestonesURL: String, notificationsURL: String, pullsURL: String, releasesURL: String, sshURL: String, stargazersURL: String, statusesURL: String, subscribersURL: String, subscriptionURL: String, tagsURL: String, teamsURL: String, treesURL: String, cloneURL: String, mirrorURL: String, hooksURL: String, svnURL: String, homepage: String, language: JSONNull?, forksCount: Int, stargazersCount: Int, watchersCount: Int, size: Int, defaultBranch: String, openIssuesCount: Int, isTemplate: Bool, topics: [String], hasIssues: Bool, hasProjects: Bool, hasWiki: Bool, hasPages: Bool, hasDownloads: Bool, archived: Bool, disabled: Bool, visibility: String, pushedAt: Date, createdAt: Date, updatedAt: Date, permissions: Permissions, allowRebaseMerge: Bool, templateRepository: JSONNull?, tempCloneToken: String, allowSquashMerge: Bool, allowAutoMerge: Bool, deleteBranchOnMerge: Bool, allowMergeCommit: Bool, subscribersCount: Int, networkCount: Int, license: License, forks: Int, openIssues: Int, watchers: Int) {
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.repositoryPrivate = repositoryPrivate
        self.htmlURL = htmlURL
        self.repositoryDescription = repositoryDescription
        self.fork = fork
        self.url = url
        self.archiveURL = archiveURL
        self.assigneesURL = assigneesURL
        self.blobsURL = blobsURL
        self.branchesURL = branchesURL
        self.collaboratorsURL = collaboratorsURL
        self.commentsURL = commentsURL
        self.commitsURL = commitsURL
        self.compareURL = compareURL
        self.contentsURL = contentsURL
        self.contributorsURL = contributorsURL
        self.deploymentsURL = deploymentsURL
        self.downloadsURL = downloadsURL
        self.eventsURL = eventsURL
        self.forksURL = forksURL
        self.gitCommitsURL = gitCommitsURL
        self.gitRefsURL = gitRefsURL
        self.gitTagsURL = gitTagsURL
        self.gitURL = gitURL
        self.issueCommentURL = issueCommentURL
        self.issueEventsURL = issueEventsURL
        self.issuesURL = issuesURL
        self.keysURL = keysURL
        self.labelsURL = labelsURL
        self.languagesURL = languagesURL
        self.mergesURL = mergesURL
        self.milestonesURL = milestonesURL
        self.notificationsURL = notificationsURL
        self.pullsURL = pullsURL
        self.releasesURL = releasesURL
        self.sshURL = sshURL
        self.stargazersURL = stargazersURL
        self.statusesURL = statusesURL
        self.subscribersURL = subscribersURL
        self.subscriptionURL = subscriptionURL
        self.tagsURL = tagsURL
        self.teamsURL = teamsURL
        self.treesURL = treesURL
        self.cloneURL = cloneURL
        self.mirrorURL = mirrorURL
        self.hooksURL = hooksURL
        self.svnURL = svnURL
        self.homepage = homepage
        self.language = language
        self.forksCount = forksCount
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.size = size
        self.defaultBranch = defaultBranch
        self.openIssuesCount = openIssuesCount
        self.isTemplate = isTemplate
        self.topics = topics
        self.hasIssues = hasIssues
        self.hasProjects = hasProjects
        self.hasWiki = hasWiki
        self.hasPages = hasPages
        self.hasDownloads = hasDownloads
        self.archived = archived
        self.disabled = disabled
        self.visibility = visibility
        self.pushedAt = pushedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.allowRebaseMerge = allowRebaseMerge
        self.templateRepository = templateRepository
        self.tempCloneToken = tempCloneToken
        self.allowSquashMerge = allowSquashMerge
        self.allowAutoMerge = allowAutoMerge
        self.deleteBranchOnMerge = deleteBranchOnMerge
        self.allowMergeCommit = allowMergeCommit
        self.subscribersCount = subscribersCount
        self.networkCount = networkCount
        self.license = license
        self.forks = forks
        self.openIssues = openIssues
        self.watchers = watchers
    }
}

// MARK: Repository convenience initializers and mutators

public extension Repository {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Repository.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        nodeID: String? = nil,
        name: String? = nil,
        fullName: String? = nil,
        owner: Assignee? = nil,
        repositoryPrivate: Bool? = nil,
        htmlURL: String? = nil,
        repositoryDescription: String? = nil,
        fork: Bool? = nil,
        url: String? = nil,
        archiveURL: String? = nil,
        assigneesURL: String? = nil,
        blobsURL: String? = nil,
        branchesURL: String? = nil,
        collaboratorsURL: String? = nil,
        commentsURL: String? = nil,
        commitsURL: String? = nil,
        compareURL: String? = nil,
        contentsURL: String? = nil,
        contributorsURL: String? = nil,
        deploymentsURL: String? = nil,
        downloadsURL: String? = nil,
        eventsURL: String? = nil,
        forksURL: String? = nil,
        gitCommitsURL: String? = nil,
        gitRefsURL: String? = nil,
        gitTagsURL: String? = nil,
        gitURL: String? = nil,
        issueCommentURL: String? = nil,
        issueEventsURL: String? = nil,
        issuesURL: String? = nil,
        keysURL: String? = nil,
        labelsURL: String? = nil,
        languagesURL: String? = nil,
        mergesURL: String? = nil,
        milestonesURL: String? = nil,
        notificationsURL: String? = nil,
        pullsURL: String? = nil,
        releasesURL: String? = nil,
        sshURL: String? = nil,
        stargazersURL: String? = nil,
        statusesURL: String? = nil,
        subscribersURL: String? = nil,
        subscriptionURL: String? = nil,
        tagsURL: String? = nil,
        teamsURL: String? = nil,
        treesURL: String? = nil,
        cloneURL: String? = nil,
        mirrorURL: String? = nil,
        hooksURL: String? = nil,
        svnURL: String? = nil,
        homepage: String? = nil,
        language: JSONNull?? = nil,
        forksCount: Int? = nil,
        stargazersCount: Int? = nil,
        watchersCount: Int? = nil,
        size: Int? = nil,
        defaultBranch: String? = nil,
        openIssuesCount: Int? = nil,
        isTemplate: Bool? = nil,
        topics: [String]? = nil,
        hasIssues: Bool? = nil,
        hasProjects: Bool? = nil,
        hasWiki: Bool? = nil,
        hasPages: Bool? = nil,
        hasDownloads: Bool? = nil,
        archived: Bool? = nil,
        disabled: Bool? = nil,
        visibility: String? = nil,
        pushedAt: Date? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        permissions: Permissions? = nil,
        allowRebaseMerge: Bool? = nil,
        templateRepository: JSONNull?? = nil,
        tempCloneToken: String? = nil,
        allowSquashMerge: Bool? = nil,
        allowAutoMerge: Bool? = nil,
        deleteBranchOnMerge: Bool? = nil,
        allowMergeCommit: Bool? = nil,
        subscribersCount: Int? = nil,
        networkCount: Int? = nil,
        license: License? = nil,
        forks: Int? = nil,
        openIssues: Int? = nil,
        watchers: Int? = nil
    ) -> Repository {
        return Repository(
            id: id ?? self.id,
            nodeID: nodeID ?? self.nodeID,
            name: name ?? self.name,
            fullName: fullName ?? self.fullName,
            owner: owner ?? self.owner,
            repositoryPrivate: repositoryPrivate ?? self.repositoryPrivate,
            htmlURL: htmlURL ?? self.htmlURL,
            repositoryDescription: repositoryDescription ?? self.repositoryDescription,
            fork: fork ?? self.fork,
            url: url ?? self.url,
            archiveURL: archiveURL ?? self.archiveURL,
            assigneesURL: assigneesURL ?? self.assigneesURL,
            blobsURL: blobsURL ?? self.blobsURL,
            branchesURL: branchesURL ?? self.branchesURL,
            collaboratorsURL: collaboratorsURL ?? self.collaboratorsURL,
            commentsURL: commentsURL ?? self.commentsURL,
            commitsURL: commitsURL ?? self.commitsURL,
            compareURL: compareURL ?? self.compareURL,
            contentsURL: contentsURL ?? self.contentsURL,
            contributorsURL: contributorsURL ?? self.contributorsURL,
            deploymentsURL: deploymentsURL ?? self.deploymentsURL,
            downloadsURL: downloadsURL ?? self.downloadsURL,
            eventsURL: eventsURL ?? self.eventsURL,
            forksURL: forksURL ?? self.forksURL,
            gitCommitsURL: gitCommitsURL ?? self.gitCommitsURL,
            gitRefsURL: gitRefsURL ?? self.gitRefsURL,
            gitTagsURL: gitTagsURL ?? self.gitTagsURL,
            gitURL: gitURL ?? self.gitURL,
            issueCommentURL: issueCommentURL ?? self.issueCommentURL,
            issueEventsURL: issueEventsURL ?? self.issueEventsURL,
            issuesURL: issuesURL ?? self.issuesURL,
            keysURL: keysURL ?? self.keysURL,
            labelsURL: labelsURL ?? self.labelsURL,
            languagesURL: languagesURL ?? self.languagesURL,
            mergesURL: mergesURL ?? self.mergesURL,
            milestonesURL: milestonesURL ?? self.milestonesURL,
            notificationsURL: notificationsURL ?? self.notificationsURL,
            pullsURL: pullsURL ?? self.pullsURL,
            releasesURL: releasesURL ?? self.releasesURL,
            sshURL: sshURL ?? self.sshURL,
            stargazersURL: stargazersURL ?? self.stargazersURL,
            statusesURL: statusesURL ?? self.statusesURL,
            subscribersURL: subscribersURL ?? self.subscribersURL,
            subscriptionURL: subscriptionURL ?? self.subscriptionURL,
            tagsURL: tagsURL ?? self.tagsURL,
            teamsURL: teamsURL ?? self.teamsURL,
            treesURL: treesURL ?? self.treesURL,
            cloneURL: cloneURL ?? self.cloneURL,
            mirrorURL: mirrorURL ?? self.mirrorURL,
            hooksURL: hooksURL ?? self.hooksURL,
            svnURL: svnURL ?? self.svnURL,
            homepage: homepage ?? self.homepage,
            language: language ?? self.language,
            forksCount: forksCount ?? self.forksCount,
            stargazersCount: stargazersCount ?? self.stargazersCount,
            watchersCount: watchersCount ?? self.watchersCount,
            size: size ?? self.size,
            defaultBranch: defaultBranch ?? self.defaultBranch,
            openIssuesCount: openIssuesCount ?? self.openIssuesCount,
            isTemplate: isTemplate ?? self.isTemplate,
            topics: topics ?? self.topics,
            hasIssues: hasIssues ?? self.hasIssues,
            hasProjects: hasProjects ?? self.hasProjects,
            hasWiki: hasWiki ?? self.hasWiki,
            hasPages: hasPages ?? self.hasPages,
            hasDownloads: hasDownloads ?? self.hasDownloads,
            archived: archived ?? self.archived,
            disabled: disabled ?? self.disabled,
            visibility: visibility ?? self.visibility,
            pushedAt: pushedAt ?? self.pushedAt,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            permissions: permissions ?? self.permissions,
            allowRebaseMerge: allowRebaseMerge ?? self.allowRebaseMerge,
            templateRepository: templateRepository ?? self.templateRepository,
            tempCloneToken: tempCloneToken ?? self.tempCloneToken,
            allowSquashMerge: allowSquashMerge ?? self.allowSquashMerge,
            allowAutoMerge: allowAutoMerge ?? self.allowAutoMerge,
            deleteBranchOnMerge: deleteBranchOnMerge ?? self.deleteBranchOnMerge,
            allowMergeCommit: allowMergeCommit ?? self.allowMergeCommit,
            subscribersCount: subscribersCount ?? self.subscribersCount,
            networkCount: networkCount ?? self.networkCount,
            license: license ?? self.license,
            forks: forks ?? self.forks,
            openIssues: openIssues ?? self.openIssues,
            watchers: watchers ?? self.watchers
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - License
public struct License: Codable, Equatable {
    public let key, name: String
    public let url: String
    public let spdxID, nodeID: String
    public let htmlURL: String

    enum CodingKeys: String, CodingKey {
        case key, name, url
        case spdxID = "spdx_id"
        case nodeID = "node_id"
        case htmlURL = "html_url"
    }

    public init(key: String, name: String, url: String, spdxID: String, nodeID: String, htmlURL: String) {
        self.key = key
        self.name = name
        self.url = url
        self.spdxID = spdxID
        self.nodeID = nodeID
        self.htmlURL = htmlURL
    }
}

// MARK: License convenience initializers and mutators

public extension License {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(License.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        key: String? = nil,
        name: String? = nil,
        url: String? = nil,
        spdxID: String? = nil,
        nodeID: String? = nil,
        htmlURL: String? = nil
    ) -> License {
        return License(
            key: key ?? self.key,
            name: name ?? self.name,
            url: url ?? self.url,
            spdxID: spdxID ?? self.spdxID,
            nodeID: nodeID ?? self.nodeID,
            htmlURL: htmlURL ?? self.htmlURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Permissions
public struct Permissions: Codable, Equatable {
    public let admin, push, pull: Bool

    public init(admin: Bool, push: Bool, pull: Bool) {
        self.admin = admin
        self.push = push
        self.pull = pull
    }
}

// MARK: Permissions convenience initializers and mutators

public extension Permissions {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Permissions.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        admin: Bool? = nil,
        push: Bool? = nil,
        pull: Bool? = nil
    ) -> Permissions {
        return Permissions(
            admin: admin ?? self.admin,
            push: push ?? self.push,
            pull: pull ?? self.pull
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

public typealias Issues = [Issue]

public extension Array where Element == Issues.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Issues.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
