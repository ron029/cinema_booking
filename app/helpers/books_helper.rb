module BooksHelper
  def convert_time_to_hh_mm_ss_ampm(time_string)
    # Parse the time string to get the hour and AM/PM
    hour, am_pm = time_string.split

    # Convert to 24-hour format
    hour = am_pm.downcase == 'pm' ? hour.to_i + 12 : hour.to_i
 
    # Format the time as 'HH:MM:SS AM/PM'
    time = Time.new(1970, 1, 1, hour, 0, 0)
    time.strftime('%I:%M:%S %p')
  end
end
