module Twitter4j4r
  class Listener

    def initialize(client, blocks)
      @client = client
      @blocks = blocks
    end

    protected
    def call_block_with_client(block_key, *args)
      @blocks[block_key].call(*((args + [@client])[0, @blocks[block_key].arity])) if @blocks[block_key]
    end
  end
end