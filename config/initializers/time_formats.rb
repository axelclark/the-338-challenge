#
# Date and Time formats
#
{
  simple: '%B %e',
}.each do |k, v|
  Date::DATE_FORMATS[k] = v
  Time::DATE_FORMATS[k] = v
end

#
# Time formats
#
Time::DATE_FORMATS.merge!({
  time: '%l:%M%p'
})
