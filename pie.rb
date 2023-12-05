def cut_cake(cake, n)
    raisin_count = cake.flatten.count('o')
    
    if raisin_count < n
      puts "Неможливо розрізати торт на #{n} частин з однією родзинкою у кожній."
      return
    end
  
    rows, cols = cake.size, cake[0].size
    target_area = raisin_count / n
  
    def find_divisors(area)
      divisors = []
      (1..Math.sqrt(area)).each do |i|
        if area % i == 0
          divisors << [i, area / i]
        end
      end
      divisors
    end
  
    def check_division(cake, divisors)
      divisors.each do |row_div, col_div|
        (0...cake.size).each do |row|
          (0...cake[0].size).each do |col|
            if (row + row_div <= cake.size) && (col + col_div <= cake[0].size)
              sub_cake = cake[row...(row + row_div)].map { |r| r[col...(col + col_div)] }
              return sub_cake if sub_cake.flatten.count('o') == target_area
            end
          end
        end
      end
      nil
    end
  
    divisors = find_divisors(target_area)
  
    result = check_division(cake, divisors)
    if result.nil?
      puts "Неможливо знайти різання для заданих параметрів."
    else
      puts result
    end
  end
  
  # Приклад використання:
  cake = [
    "........",
    "..o.....",
    "...o....",
    "........"
  ]
  
  cut_cake(cake, 2)
  