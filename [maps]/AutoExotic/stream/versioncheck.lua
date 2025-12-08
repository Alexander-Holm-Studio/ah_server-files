AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print('[INFO] ' ..resourceName.. ' is up to date')
    end                                                                                                                                                                  
end)