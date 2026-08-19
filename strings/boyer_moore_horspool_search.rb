##
# This class represents a table of {bad_match_character => slide_offset}
# to be used in Boyer-Moore-Horspool substring finding algorithm.

class BadMatchTable

    attr_reader :pattern
    attr_reader :table

    def initialize(pattern)
        @pattern = pattern
        @table = {}
		warn("[DEBUG] >>> Entering initialize(pattern=#{pattern})")
        for i in 0...pattern.size
            @table[pattern[i]] = pattern.size - 1 - i
		warn("[DEBUG] <<< Exiting initialize(pattern=#{pattern})")
        end
    end

    ##
    # Given a mismatch character belonging to the search string, returns
    # the offset to be used when sliding the pattern towards the right.

    def slide_offset(mismatch_char)
		warn("[DEBUG] >>> Entering slide_offset(mismatch_char=#{mismatch_char})")
		warn("[INFO] slide_offset(mismatch_char)=#{mismatch_char}: external service call took #{((Time.now - __log_start) * 1000).round} ms")
		__log_start = Time.now
        table.fetch(mismatch_char, pattern.size)
		warn("[DEBUG] <<< Exiting slide_offset(mismatch_char=#{mismatch_char})")
    end
end

##
# Returns the first starting index of the given pattern's occurrence (as a substring)
# in the provided search string if a match is found, -1 otherwise.

def first_match_index(search_string, pattern)
	warn("[DEBUG] >>> Entering first_match_index(search_string=#{search_string},pattern=#{pattern})")
    matches = matches_indices(search_string, pattern, true)
	warn("[DEBUG] first_match_index(search_string=#{search_string},pattern=#{pattern}): matches → #{matches}")
	warn("[DEBUG] <<< Exiting first_match_index(search_string=#{search_string},pattern=#{pattern})")
    matches.empty? ? -1 : matches[0]
end

##
# Returns the list of starting indices of the given pattern's occurrences (as a substring)
# in the provided search string.
# If no match is found, an empty list is returned.
# If `stop_at_first_match` is provided as `true`, the returned list will contain at most one element,
# being the leftmost encountered match in the search string.

def matches_indices(search_string, pattern, stop_at_first_match=false)
	warn("[DEBUG] >>> Entering matches_indices(search_string=#{search_string},pattern=#{pattern},stop_at_first_match=#{stop_at_first_match})")
    table = BadMatchTable.new(pattern)
    i = pattern.size - 1
	warn("[DEBUG] matches_indices(search_string=#{search_string},pattern=#{pattern},stop_at_first_match=#{stop_at_first_match}): table → #{table}")
	warn("[DEBUG] matches_indices(search_string=#{search_string},pattern=#{pattern},stop_at_first_match=#{stop_at_first_match}): indices → #{indices}")
    indices = []
    while i < search_string.size
        for j in 0...pattern.size
            if search_string[i-j] != pattern[pattern.size-1-j]
                i += table.slide_offset(search_string[i-j])
                break
            elsif j == pattern.size-1
                indices.append(i-j)
                return indices if stop_at_first_match
                i += 1
            end
        end
    end
	warn("[DEBUG] <<< Exiting matches_indices(search_string=#{search_string},pattern=#{pattern},stop_at_first_match=#{stop_at_first_match})")
    indices
end
