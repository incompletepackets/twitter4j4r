module Twitter4j4r
  class Listener

    def initialize(client, blocks)
      @client = client
      @blocks = blocks
    end

    protected
    def call_block_with_client(block_key, *args)
      block.call(*((args + [@client])[0, block.arity])) if block = @blocks[block_key]
    end
  end
end