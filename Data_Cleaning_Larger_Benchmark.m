function Daily_Adjust_Close_Larger_Benchmark=Data_Cleaning_Larger_Benchmark(Daily_Adjust_Close,Daily_Adjust_Close_Larger_Set)

Daily_Adjust_Close_Larger_Benchmark=Daily_Adjust_Close;
Daily_Adjust_Close_Larger_Benchmark(:,end)=Daily_Adjust_Close_Larger_Set(:,end);

end

