function Convert-DateToTranslatedString {
    param (
        [Parameter(Mandatory=$true)]
        [string]$CultureNeed,
        [Parameter(Mandatory=$true)]
        [datetime]$DateToConvert
    )

    $LangOS = New-Object system.globalization.cultureinfo($(Get-Culture).Name)
    $LangTranslate = New-Object system.globalization.cultureinfo($CultureNeed)

    $formattedDate = $DateToConvert.ToString($LangTranslate.DateTimeFormat.LongDatePattern)

    return $formattedDate.Replace($($LangOS.DateTimeFormat.GetMonthName($DateToConvert.Month)),$($LangTranslate.DateTimeFormat.GetMonthName($DateToConvert.Month))).Replace($($LangOS.DateTimeFormat.GetDayName($DateToConvert.DayOfWeek)),$($LangTranslate.DateTimeFormat.GetDayName($DateToConvert.DayOfWeek)))
}
