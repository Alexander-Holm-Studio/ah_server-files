if Config.Language ~= "sv" then
    return
end

Locales = {
    ["APP"] = {
        ["NAME"] = "Nyheter",
        ["DESCRIPTION"] = "Håll dig uppdaterad om vad som pågår i staden.",
    },

    ["PUBLISHED_NOTIFICATION"] = {
        ["TITLE"] = "Ny Artikel",
        ["DESCRIPTION"] = "{title}"
    },
    ["UNPUBLISHED_NOTIFICATION"] = {
        ["TITLE"] = "Artikel Opublicerad",
        ["DESCRIPTION"] = "Din artikel {title} har blivit opublicerad."
    },
    ["DELETED_NOTIFICATION"] = {
        ["TITLE"] = "Artikel Borttagen",
        ["DESCRIPTION"] = "Din artikel {title} har blivit borttagen."
    },

    ["NEW_ARTICLE_WEBHOOK"] = {
        ["TITLE"] = "{title}",
        ["DESCRIPTION"] = "{content}"
    },

    ["LOGS"] = {
        ["CREATED_ARTICLE"] = "Skapade en artikel med id `{id}`",
        ["CREATED_CATEGORY"] = "Skapade en ny kategori `{category}`",
        ["UPDATED_ARTICLE"] = "Uppdaterade sin artikel med id `{id}`",
        ["DELETED_ARTICLE"] = "Raderade sin artikel med id `${id}`",
        ["DELETED_OTHER_ARTICLE"] = "Raderade artikel `${id}`",
        ["UNPUBLISH_OTHER"] = "Avpublicerade artikel `${id}`",
        ["UPDATED_PROFILE"] = "Uppdaterade sin profil"
    },

    ["ARTICLES"] = "Artiklar",
    ["DRAFTS"] = "Utkast",
    ["CHANGE_AVATAR"] = "Byt profilbild",
    ["REMOVE_AVATAR"] = "Ta bort profilbild",
    ["EDIT_AVATAR"] = "Hantera profilbild",
    ["NAME"] = "Namn",
    ["EMAIL"] = "Email",
    ["PHONE_NUMBER"] = "Telefonnummer",
    ["SAVE"] = "Spara",
    ["PUBLISH"] = "Publicera",
    ["DELETE"] = "Ta bort",
    ["CANCEL"] = "Avbryt",
    ["MANAGE"] = "Hantera",
    ["UPLOAD"] = "Ladda upp",
    ["PUBLIC_PROFILE"] = "Synlig Profil",
    ["NEW_ARTICLE"] = "Ny Artikel",

    ["TITLE"] = "Titel",
    ["CATEGORY"] = "Kategori",
    ["SELECT_CATEGORY"] = "Välj Kategori",
    ["ADD_CATEGORY"] = {
        ["TITLE"] = "Skapa Kategori",
        ["DESCRIPTION"] = "Skriv in namnet på den nya kategorin",
        ["PLACEHOLDER"] = "Namn",
        ["ADD"] = "Lägg till",
    },
    ["MOVE_UP"] = "Flytta upp",
    ["MOVE_DOWN"] = "Flytta ner",

    ["ERROR"] = "Fel",
    ["COPIED"] = "Kopierat",
    ["OK"] = "OK",
    ["EMAIL_COPIED"] = "E-postadressen har kopierats",
    ["NUMBER_COPIED"] = "Telefonnummret har kopierats",

    ["ARTICLE_UPDATED"] = "Artikel Uppdaterad",
    ["UPDATED_AT"] = "Uppdaterad {date}",
    ["PUBLISHED_AT"] = "Publicerad {date}",
    ["IMAGE_AMOUNT"] = "{current} av {total}",
    ["SEARCH_PLACEHOLDER"] = "Sök artiklar...",

    ["DELETE_ARTICLE"] = {
        ["TITLE"] = "Radera Artikel",
        ["DESCRIPTION"] = "Är du säker att du vill radera denna artikeln?",
    },

    ["DESCRIPTION"] = "Beskrivning",
    ["SET_DESCRIPTION"] = "Sätt en beskrivning",
    ["SET_DESCRIPTION_INFO"] = "Ändra bildens beskrivning",
    ["EDIT_IMAGE"] = "Ändra Bild",

    ["UNPUBLISH_ARTICLE"] = "Avpublicera Artikel",
    ["ADD_FIELD"] = "Lägg till innehåll",
    ["TEXT"] = "Text",
    ["MEDIA"] = "Media",

    ["SET_NAME"] = "Du måste ha ett namn",
    ["FAILED_PUBLISH"] = "Ett fel uppstod: {reason}",
    ["REQUIRED_FIELDS"] = "Du måste ha en titel, kategori och innehåll.",
    ["REQUIRED_TEXT_FIELD"] = "Du måste ha ett textfält.",
    ["EMPTY_MEDIA_FIELD"] = "Du kan inte ha tomma mediafält.",

    ["FOOTER"] = {
        ["HOME"] = "Hem",
        ["CATEGORIES"] = "Kategorier",
        ["SEARCH"] = "Sök",
        ["PROFILE"] = "Profil",
    },
}
