module Enumerable

	def my_each
		for i in (0...self.length)
			yield(self[i])
		end
		self
	end

	def my_each_with_index
		for i in (0...self.length)
			yield(self[i], i)
		end
	end

	def my_select
		result = []
		for i in (0...self.length)
			result.push(self[i]) if yield(self[i])
		end
		result
	end

	def my_all?
		for i in (0...self.length)
			return false unless yield(self[i])
		end
		true
	end

	def my_any?
		for i in (0...self.length)
			return true if yield(self[i])
		end
		false
	end

	def my_none?
		for i in (0...self.length)
			return false if yield(self[i])
		end
		true
	end

	def my_count(thing_to_count = false)
		count = 0
		for i in (0...self.length)
			if(thing_to_count)
				count += 1 if self[i] == thing_to_count
			elsif(block_given?)
				count += 1 if yield(self[i])
			else
				return count = self.length
			end
		end
		count
	end

	def my_map(my_proc=false)
		for i in (0...self.length)
			if my_proc
				self[i] = my_proc.call(self[i])
			else
				self[i] = yield(self[i])
			end
		end
		self		
	end

	def my_inject(acc=self[0], my_sym=false)
		my_sym, acc = acc, self[0] if acc.is_a? Symbol
		for i in (1...self.length)
			if my_sym
				acc = acc.send(my_sym, self[i])
			elsif block_given?
				acc = yield(acc, self[i])
			end
		end
		acc
	end

end

# def multiply_els(numbers)
# 	numbers.my_inject(:*)
# end