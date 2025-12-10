if Config.Language ~= "en" then
    return
end

Locales = {
    ["APP"] = {
        ["NAME"] = "News",
        ["DESCRIPTION"] = "Catch the latest news from Los Santos and beyond.",
    },

    ["PUBLISHED_NOTIFICATION"] = {
        ["TITLE"] = "New Article",
        ["DESCRIPTION"] = "{title}"
    },
    ["UNPUBLISHED_NOTIFICATION"] = {
        ["TITLE"] = "Article Unpublished",
        ["DESCRIPTION"] = "Your article {title} has been unpublished."
    },
    ["DELETED_NOTIFICATION"] = {
        ["TITLE"] = "Article Deleted",
        ["DESCRIPTION"] = "Your article {title} has been deleted."
    },

    ["NEW_ARTICLE_WEBHOOK"] = {
        ["TITLE"] = "{title}",
        ["DESCRIPTION"] = "{content}"
    },

    ["LOGS"] = {
        ["CREATED_ARTICLE"] = "Created an article with id `{id}`",
        ["CREATED_CATEGORY"] = "Created a new category `{category}`",
        ["UPDATED_ARTICLE"] = "Updated their article with id `{id}`",
        ["DELETED_ARTICLE"] = "Deleted their article with id `${id}`",
        ["DELETED_OTHER_ARTICLE"] = "Deleted article `${id}`",
        ["UNPUBLISH_OTHER"] = "Unpublished article `${id}`",
        ["UPDATED_PROFILE"] = "Updated their profile"
    },

    ["ARTICLES"] = "Articles",
    ["DRAFTS"] = "Drafts",
    ["CHANGE_AVATAR"] = "Change Avatar",
    ["REMOVE_AVATAR"] = "Remove Avatar",
    ["EDIT_AVATAR"] = "Edit avatar",
    ["NAME"] = "Name",
    ["EMAIL"] = "Email",
    ["PHONE_NUMBER"] = "Phone Number",
    ["SAVE"] = "Save",
    ["PUBLISH"] = "Publish",
    ["DELETE"] = "Delete",
    ["CANCEL"] = "Cancel",
    ["MANAGE"] = "Manage",
    ["UPLOAD"] = "Upload",
    ["PUBLIC_PROFILE"] = "Public Profile",
    ["NEW_ARTICLE"] = "New Article",

    ["TITLE"] = "Title",
    ["CATEGORY"] = "Category",
    ["SELECT_CATEGORY"] = "Select Category",
    ["ADD_CATEGORY"] = {
        ["TITLE"] = "Add Category",
        ["DESCRIPTION"] = "Enter the name of the new category",
        ["PLACEHOLDER"] = "Category Name",
        ["ADD"] = "add",
    },
    ["MOVE_UP"] = "Move Up",
    ["MOVE_DOWN"] = "Move Down",

    ["ERROR"] = "Error",
    ["COPIED"] = "Copied",
    ["OK"] = "OK",
    ["EMAIL_COPIED"] = "The email has been copied to your clipboard",
    ["NUMBER_COPIED"] = "The number has been copied to your clipboard",

    ["ARTICLE_UPDATED"] = "Article Updated",
    ["UPDATED_AT"] = "Updated {date}",
    ["PUBLISHED_AT"] = "Published {date}",
    ["IMAGE_AMOUNT"] = "{current} of {total}",
    ["SEARCH_PLACEHOLDER"] = "Search articles...",

    ["DELETE_ARTICLE"] = {
        ["TITLE"] = "Delete Article",
        ["DESCRIPTION"] = "Are you sure you want to permanently delete this article?",
    },

    ["DESCRIPTION"] = "Description",
    ["SET_DESCRIPTION"] = "Set Description",
    ["SET_DESCRIPTION_INFO"] = "Change the image's description",
    ["EDIT_IMAGE"] = "Edit Image",

    ["UNPUBLISH_ARTICLE"] = "Unpublish Article",
    ["ADD_FIELD"] = "Add Field",
    ["TEXT"] = "Text",
    ["MEDIA"] = "Media",

    ["SET_NAME"] = "Please set a display name",
    ["FAILED_PUBLISH"] = "Failed to publish article: {reason}",
    ["REQUIRED_FIELDS"] = "Please set a title, category & atleast one field",
    ["REQUIRED_TEXT_FIELD"] = "Please add atleast one text field",
    ["EMPTY_MEDIA_FIELD"] = "You cannot have any empty media fields.",

    ["FOOTER"] = {
        ["HOME"] = "Home",
        ["CATEGORIES"] = "Categories",
        ["SEARCH"] = "Search",
        ["PROFILE"] = "Profile",
    },
}
