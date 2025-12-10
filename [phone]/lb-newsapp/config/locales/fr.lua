if Config.Language ~= "fr" then
    return
end

Locales = {
    ["APP"] = {
        ["NAME"] = "News",
        ["DESCRIPTION"] = "Soyez a jour sur les nouveautés.",
    },

    ["PUBLISHED_NOTIFICATION"] = {
        ["TITLE"] = "Nouvel Article",
        ["DESCRIPTION"] = "{title}"
    },
    ["archivé_NOTIFICATION"] = {
        ["TITLE"] = "Article archivé",
        ["DESCRIPTION"] = "Votre article {title} as étais archivé."
    },
    ["DELETED_NOTIFICATION"] = {
        ["TITLE"] = "Article supprimé",
        ["DESCRIPTION"] = "Votre article {title} as étais deleted."
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
        ["UNPUBLISH_OTHER"] = "archivé article `${id}`",
        ["UPDATED_PROFILE"] = "Updated their profile"
    },

    ["ARTICLES"] = "Articles",
    ["DRAFTS"] = "Brouillons",
    ["CHANGE_AVATAR"] = "Changer d'avatar",
    ["REMOVE_AVATAR"] = "Supprimer l'avatar",
    ["EDIT_AVATAR"] = "Modifier l'avatar",
    ["NAME"] = "Nom",
    ["EMAIL"] = "Email",
    ["PHONE_NUMBER"] = "Numéro de téléphone",
    ["SAVE"] = "Sauvegarder",
    ["PUBLISH"] = "Publier",
    ["DELETE"] = "Supprimer",
    ["CANCEL"] = "Annuler",
    ["MANAGE"] = "Gestion",
    ["UPLOAD"] = "Upload",
    ["PUBLIC_PROFILE"] = "Profil public",
    ["NEW_ARTICLE"] = "Nouvel article",

    ["TITLE"] = "Titre",
    ["CATEGORY"] = "Catégorie",
    ["SELECT_CATEGORY"] = "Sélectionner la catégorie",
    ["ADD_CATEGORY"] = {
        ["TITLE"] = "Ajout de catégorie",
        ["DESCRIPTION"] = "Entrer le nom de la nouvelle catégorie",
        ["PLACEHOLDER"] = "Nom de catégorie",
        ["ADD"] = "Ajouter",
    },
    ["MOVE_UP"] = "Monter",
    ["MOVE_DOWN"] = "descendre",

    ["ERROR"] = "Erreur",
    ["COPIED"] = "Copié",
    ["OK"] = "OK",
    ["EMAIL_COPIED"] = "l'email as étais copié",
    ["NUMBER_COPIED"] = "Le numéro as étais copié",

    ["ARTICLE_UPDATED"] = "Article Mis a jour",
    ["UPDATED_AT"] = "Modifié le {date}",
    ["PUBLISHED_AT"] = "Publié le {date}",
    ["IMAGE_AMOUNT"] = "{current} sur {total}",
    ["SEARCH_PLACEHOLDER"] = "Rechercher des articles...",

    ["DELETE_ARTICLE"] = {
        ["TITLE"] = "Supprimer l'article",
        ["DESCRIPTION"] = "Êtes-vous sur de supprimer l'article ?",
    },

    ["DESCRIPTION"] = "Description",
    ["SET_DESCRIPTION"] = "Définir une description",
    ["SET_DESCRIPTION_INFO"] = "Changer l'image de description",
    ["EDIT_IMAGE"] = "Modifier l'image",

    ["UNPUBLISH_ARTICLE"] = "Archivé l'article",
    ["ADD_FIELD"] = "ajouter un champ",
    ["TEXT"] = "Text",
    ["MEDIA"] = "Media",

    ["SET_NAME"] = "Renseigner un nom valide",
    ["FAILED_PUBLISH"] = "Erreur de publication: {reason}",
    ["REQUIRED_FIELDS"] = "Merci de mettre au moins un titre, une catégorie et un champ",
    ["REQUIRED_TEXT_FIELD"] = "Merci d'ajouter au moins un champ text",
    ["EMPTY_MEDIA_FIELD"] = "Vous ne pouvez pas avoir un media vide.",

    ["FOOTER"] = {
        ["HOME"] = "Acceuil",
        ["CATEGORIES"] = "Catégories",
        ["SEARCH"] = "Recherche",
        ["PROFILE"] = "Profil",
    },
}