defmodule KV.Bucket do

  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  def get(bucket, key) do
    Agent.get(bucket, fn d ->
      Map.get(d, key)
    end)
  end

  def put(bucket, key, value) do
    Agent.update(bucket, fn d ->
      Map.put(d, key, value)
    end)
  end

  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn d ->
      Map.pop(d, key)
    end)
  end
end
