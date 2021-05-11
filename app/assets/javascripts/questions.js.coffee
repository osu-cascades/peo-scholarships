document.addEventListener('turbolinks:load', () ->
  $('form').on 'keydown', '.question_field', (event) ->
    field = event.target
    word_array = field.value.split(' ')
    word_count = word_array.length
    word_limit = field.id.split('_')[0]

    if word_array[0] == '' && word_count == 1
      word_count = 0

    if word_count > word_limit
      field.value = ''
      i = 0
      while i < word_limit
        field.value += word_array[i] + ' '
        i++
      word_count = word_limit

    counter = document.getElementById('word_counter_' + field.id.split('_')[4])
    if word_count == 1
      counter.innerHTML = word_count + ' word'
    else
      counter.innerHTML = word_count + ' words'
)
