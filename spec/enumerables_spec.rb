require "enumerables.rb"

describe "Enumerables" do

	describe ".my_each" do
		context "given array [1,2,3]" do
			context "calling 'puts' on each entry" do
				it "prints '1\n2\n3'" do
					expect([1,2,3].my_each { |entry| puts entry}).to eql("")
				end
			end
		end
	end
end