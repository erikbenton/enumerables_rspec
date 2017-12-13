require "enumerables.rb"

describe "Enumerables" do

	let(:array) {[1,2,3]}
	let(:result) {[]}

	describe "#my_each" do
		context "when given a block" do
			it "calls the given block once for each element, then returns self" do
				#check for proper traversal
				expect { |block| array.my_each(&block) }.to yield_successive_args(1,2,3)
				#check for returning self
				expect(array.my_each { |entry| result.push(entry*2) }).to eql(array)
				#check for proper application of block
				expect(result).to eql([2,4,6])
			end
		end

		context "when given no block" do
			it "gives back an Enumertor" do
				expect(array.my_each).to be_is_a(Enumerator)
			end
		end
	end

	describe "#my_each_with_index" do
		context "when given a block" do
			it "calls the given block once for each element and gives its index" do
				expect(array.my_each_with_index { |entry, ind| result.push(entry*ind) }).to eql(array)
				#check for proper application of block
				expect(result).to eql([0, 2, 6])
			end
		end
	end

	describe "#my_select" do
		context "when given a block" do
			context "that selects items in the array" do
				it "returns the items that match the selection in an array" do
					expect(array.my_select { |entry| entry > 1 }).to eql([2,3])
				end
			end
			context "that doesn't select items in the array" do
				it "returns false" do
					expect(array.my_select { |entry| entry > 3 }).to eql(false)
				end
			end
		end
	end

	describe "#my_all?" do
		context "when given a block" do
			context "that every element in array satisfies" do
				it "returns true" do
					expect(array.my_all? { |entry| entry > 0 }).to eql(true)
				end
			end
			context "where an element doesn't satisfy its condition" do
				it "returns false" do
					expect(array.my_all? {|entry| entry == 1 }).to eql(false)
				end
			end
		end
	end

	describe "#my_any?" do
		context "when given a block" do
			context "that a single element in the array satisfies" do
				it "returns true" do
					expect(array.my_any? { |entry| entry == 1 }).to eql(true)
				end
			end
			context "where no element satisfies its condition" do
				it "returns false" do
					expect(array.my_all? {|entry| entry == 0 }).to eql(false)
				end
			end
		end
	end

	describe "#my_none?" do
		context "when given a block" do
			context "that no element in array satisfies" do
				it "returns true" do
					expect(array.my_none? { |entry| entry < 0 }).to eql(true)
				end
			end
			context "where an element satisfies its condition" do
				it "returns false" do
					expect(array.my_none? {|entry| entry == 1 }).to eql(false)
				end
			end
		end
	end
end