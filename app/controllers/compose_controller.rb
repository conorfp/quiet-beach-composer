class ComposeController < ApplicationController
  def index
    # generate tempo as random integer

@tempo = rand(40...180)

# generate time signature

@time_signature = ['4/4','3/4','4/4','6/8','5/4'].sample

# randomly select key

@keys = ['A','Bb','B','C','Db','D','Eb','E','F','Gb','G','Ab']
@key = @keys.sample
@key_qualitys = ['Major','Harmonic Minor', 'Natural Minor']
@key_quality = @key_qualitys.sample

# get notes in the key

t_index = @keys.index(@key)

@tonic = @keys[t_index]
@min_2 = (t_index + 1) <= 11 ? @keys[t_index + 1] :  @keys[t_index + 1 - 12]
@maj_2 = (t_index + 2) <= 11 ? @keys[t_index + 2] :  @keys[t_index + 2 - 12]
@min_3 = (t_index + 3) <= 11 ? @keys[t_index + 3] :  @keys[t_index + 3 - 12]
@maj_3 = (t_index + 4) <= 11 ? @keys[t_index + 4] :  @keys[t_index + 4 - 12]
@per_4 = (t_index + 5) <= 11 ? @keys[t_index + 5] :  @keys[t_index + 5 - 12]
@tritone = (t_index + 6) <= 11 ? @keys[t_index + 6] :  @keys[t_index + 6 - 12]
@per_5 = (t_index + 7) <= 11 ? @keys[t_index + 7] :  @keys[t_index + 7 - 12]
@min_6 = (t_index + 8) <= 11 ? @keys[t_index + 8] :  @keys[t_index + 8 - 12]
@maj_6 = (t_index + 9) <= 11 ? @keys[t_index + 9] :  @keys[t_index + 9 - 12]
@min_7 = (t_index + 10) <= 11 ? @keys[t_index + 10] :  @keys[t_index + 10 - 12] 
@maj_7 = (t_index + 11) <= 11 ? @keys[t_index + 11] :  @keys[t_index + 11 - 12]
@octave = @keys[t_index]

if @key_quality == 'Major'
    @key_notes = [@tonic,@maj_2,@maj_3,@per_4,@per_5,@maj_6,@maj_7]
elsif @key_quality == 'Natural Minor'
    @key_notes = [@tonic,@maj_2,@min_3,@per_4,@per_5,@min_6,@min_7]
else
    @key_notes = [@tonic,@maj_2,@min_3,@per_4,@per_5,@min_6,@maj_7]
end    


# get chord names

one = @key_notes[0]
two = @key_notes[1]
three = @key_notes[2]
four = @key_notes[3]
five = @key_notes[4]
six = @key_notes[5]
seven = @key_notes[6]
def minor(x)
    x + "m"
end
def seventh(x)
    x + "7"
end



# randomly select progressions for each section
@maj_progressions = [
    {'I-IV' => [one,four]},
    {'I-V' => [one,five]},
    {'I-IV-V' => [one,four,five]},
    {'I-IV-V7' => [one,four,seventh(five)]},
    {'I-IV-I-V' => [one,four,one,five]},
    {'I-IV-I-V7' => [one,four,one,seventh(five)]},
    {'I-IV-V-IV' => [one,four,five,four]},
    {'I-V-vi-IV' => [one,five,minor(six),four]},
    {'I-ii-IV-V' => [one,minor(two),four,five]},
    {'I-ii-IV' => [one,minor(two),four]}#,
    # {'I-vi-ii-V' => []},
    # {'I-vi-IV-V' => []},
    # {'I-vi-ii-IV-V7' => []},
    # {'I-vi-ii-V7-ii' => []},
    # {'IV-I-IV-V' => []},
    # {'ii7-V7-I' => []},
    # {'I-IV-I-V7-IV-I' => []},
]

@nmin_progressions = [
    {'i-iv-v' => [minor(one),minor(four),minor(five)]},
    {'i-VI-VII' => [minor(one),six,seven]},
    {'i-III-VII-VI' => [minor(one),three,seven,six]},	
    {'i-VII-iv-VI' => [minor(one),seven,minor(four),six]}    
]

@hmin_progressions = [
    {'i-iv-V' => [minor(one),minor(four),five]},
    {'i-iv-V-VI' => [minor(one),minor(four),five,six]}   
    ]

if @key_quality == 'Major'
    @progression = @maj_progressions.sample
elsif @key_quality == 'Natural Minor'
    @progression = @nmin_progressions.sample
else
    @progression = @hmin_progressions.sample
end  



# // define sections

# A = verse B = chorus C = bridge

# // randomly select song structure

# ABABCBB
# ABABCAB
# ABCABCBC
# AABAB
# ABACBAA

@song_a = "This one is in #{@time_signature} at #{@tempo} BPM in the key of #{@key} #{@key_quality}."
@song_b = "The notes are #{@key_notes.join(", ")}."
@song_c = "The progression goes #{@progression.keys}, or #{@progression.values.join("-")}."
  end
end
