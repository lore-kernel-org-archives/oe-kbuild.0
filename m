Content-Type: multipart/mixed; boundary="===============8327660654167119748=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/blk-mq.c:1302:2: warning: Address of stack memory associated with local variable 'wait' returned to caller [clang-analyzer-core.StackAddressEscape]
Date: Sun, 29 May 2022 05:18:47 +0800
Message-ID: <202205290526.Z2BTmGZk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8327660654167119748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ming Lei <ming.lei@redhat.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: a327c341dc65e38af7a2398e7313e6f2c4a813db blk-mq: fix passthrough pl=
ugging
date:   2 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220529/202205290526.Z2BTmGZk-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da327c341dc65e38af7a2398e7313e6f2c4a813db
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a327c341dc65e38af7a2398e7313e6f2c4a813db
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   block/blk-mq.c:985:3: note: Loop condition is false.  Exiting loop
                   WRITE_ONCE(rq->state, MQ_RQ_IDLE);
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   block/blk-mq.c:985:3: note: Loop condition is false.  Exiting loop
                   WRITE_ONCE(rq->state, MQ_RQ_IDLE);
                   ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:53:35: note: expanded from macro '__WRITE_O=
NCE'
   #define __WRITE_ONCE(x, val)                                            \
                                                                           ^
   block/blk-mq.c:985:3: note: Loop condition is false.  Exiting loop
                   WRITE_ONCE(rq->state, MQ_RQ_IDLE);
                   ^
   include/asm-generic/rwonce.h:58:33: note: expanded from macro 'WRITE_ONC=
E'
   #define WRITE_ONCE(x, val)                                              \
                                                                           ^
   block/blk-mq.c:986:7: note: Assuming the condition is false
                   if (!req_ref_put_and_test(rq))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:986:3: note: Taking false branch
                   if (!req_ref_put_and_test(rq))
                   ^
   block/blk-mq.c:992:7: note: 'nr_tags' is not equal to TAG_COMP_BATCH
                   if (nr_tags =3D=3D TAG_COMP_BATCH || cur_hctx !=3D rq->m=
q_hctx) {
                       ^~~~~~~
   block/blk-mq.c:992:7: note: Left side of '||' is false
   block/blk-mq.c:992:36: note: Assuming 'cur_hctx' is equal to field 'mq_h=
ctx'
                   if (nr_tags =3D=3D TAG_COMP_BATCH || cur_hctx !=3D rq->m=
q_hctx) {
                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:992:3: note: Taking false branch
                   if (nr_tags =3D=3D TAG_COMP_BATCH || cur_hctx !=3D rq->m=
q_hctx) {
                   ^
   block/blk-mq.c:975:15: note: Left side of '&&' is true
           while ((rq =3D rq_list_pop(&iob->req_list)) !=3D NULL) {
                        ^
   include/linux/blk-mq.h:226:6: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
               ^
   block/blk-mq.c:975:15: note: Assuming the condition is false
           while ((rq =3D rq_list_pop(&iob->req_list)) !=3D NULL) {
                        ^
   include/linux/blk-mq.h:226:19: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
                            ^~~~~~~~~~
   block/blk-mq.c:975:15: note: Taking false branch
           while ((rq =3D rq_list_pop(&iob->req_list)) !=3D NULL) {
                        ^
   include/linux/blk-mq.h:226:2: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
           ^
   block/blk-mq.c:975:2: note: Loop condition is false. Execution continues=
 on line 1001
           while ((rq =3D rq_list_pop(&iob->req_list)) !=3D NULL) {
           ^
   block/blk-mq.c:1001:6: note: 'nr_tags' is 1
           if (nr_tags)
               ^~~~~~~
   block/blk-mq.c:1001:2: note: Taking true branch
           if (nr_tags)
           ^
   block/blk-mq.c:1002:26: note: Passing null pointer value via 1st paramet=
er 'hctx'
                   blk_mq_flush_tag_batch(cur_hctx, tags, nr_tags);
                                          ^~~~~~~~
   block/blk-mq.c:1002:3: note: Calling 'blk_mq_flush_tag_batch'
                   blk_mq_flush_tag_batch(cur_hctx, tags, nr_tags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:952:28: note: Access to field 'queue' results in a derefe=
rence of a null pointer (loaded from variable 'hctx')
           struct request_queue *q =3D hctx->queue;
                                     ^~~~
>> block/blk-mq.c:1302:2: warning: Address of stack memory associated with =
local variable 'wait' returned to caller [clang-analyzer-core.StackAddressE=
scape]
           return (blk_status_t)(uintptr_t)rq->end_io_data;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:1293:2: note: Taking false branch
           if (blk_rq_is_poll(rq))
           ^
   block/blk-mq.c:1295:11: note: 'hang_check' is 0
           else if (hang_check)
                    ^~~~~~~~~~
   block/blk-mq.c:1295:7: note: Taking false branch
           else if (hang_check)
                ^
   block/blk-mq.c:1302:2: note: Address of stack memory associated with loc=
al variable 'wait' returned to caller
           return (blk_status_t)(uintptr_t)rq->end_io_data;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:1343:2: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(rq, next, &rq_list, queuelist) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   block/blk-mq.c:1340:2: note: Calling 'list_splice_init'
           list_splice_init(&q->requeue_list, &rq_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:490:6: note: Assuming the condition is false
           if (!list_empty(list)) {
               ^~~~~~~~~~~~~~~~~
   include/linux/list.h:490:2: note: Taking false branch
           if (!list_empty(list)) {
           ^
   block/blk-mq.c:1340:2: note: Returning from 'list_splice_init'
           list_splice_init(&q->requeue_list, &rq_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:1343:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(rq, next, &rq_list, queuelist) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   block/blk-mq.c:4234:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^~~~~~
   block/blk-mq.c:4234:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^~~~~~
   block/blk-mq.c:4344:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(set, 0, sizeof(*set));
           ^~~~~~
   block/blk-mq.c:4344:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(set, 0, sizeof(*set));
           ^~~~~~
   include/asm-generic/bitops/non-atomic.h:118:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   block/blk-mq.c:3388:9: note: Assuming '____ptr' is null
           hctx =3D hlist_entry_safe(node, struct blk_mq_hw_ctx, cpuhp_dead=
);
                  ^
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   block/blk-mq.c:3388:9: note: '?' condition is false
           hctx =3D hlist_entry_safe(node, struct blk_mq_hw_ctx, cpuhp_dead=
);
                  ^
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   block/blk-mq.c:3389:7: note: Calling 'cpumask_test_cpu'
           if (!cpumask_test_cpu(cpu, hctx->cpumask))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:379:38: note: Passing null pointer value via 2nd=
 parameter 'addr'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                                               ^
   include/linux/cpumask.h:26:29: note: expanded from macro 'cpumask_bits'
   #define cpumask_bits(maskp) ((maskp)->bits)
                               ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:379:9: note: Calling 'arch_test_bit'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                  ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));

vim +/wait +1302 block/blk-mq.c

4054cff92c3578 Christoph Hellwig 2021-11-17  1266  =

4054cff92c3578 Christoph Hellwig 2021-11-17  1267  /**
4054cff92c3578 Christoph Hellwig 2021-11-17  1268   * blk_execute_rq - inse=
rt a request into queue for execution
4054cff92c3578 Christoph Hellwig 2021-11-17  1269   * @rq:		request to inse=
rt
4054cff92c3578 Christoph Hellwig 2021-11-17  1270   * @at_head:    insert r=
equest at head or tail of queue
4054cff92c3578 Christoph Hellwig 2021-11-17  1271   *
4054cff92c3578 Christoph Hellwig 2021-11-17  1272   * Description:
4054cff92c3578 Christoph Hellwig 2021-11-17  1273   *    Insert a fully pre=
pared request at the back of the I/O scheduler queue
4054cff92c3578 Christoph Hellwig 2021-11-17  1274   *    for execution and =
wait for completion.
4054cff92c3578 Christoph Hellwig 2021-11-17  1275   * Return: The blk_statu=
s_t result provided to blk_mq_end_request().
4054cff92c3578 Christoph Hellwig 2021-11-17  1276   */
b84ba30b6c7a75 Christoph Hellwig 2021-11-26  1277  blk_status_t blk_execute=
_rq(struct request *rq, bool at_head)
4054cff92c3578 Christoph Hellwig 2021-11-17  1278  {
4054cff92c3578 Christoph Hellwig 2021-11-17  1279  	DECLARE_COMPLETION_ONST=
ACK(wait);
4054cff92c3578 Christoph Hellwig 2021-11-17  1280  	unsigned long hang_chec=
k;
4054cff92c3578 Christoph Hellwig 2021-11-17  1281  =

a327c341dc65e3 Ming Lei          2022-05-12  1282  	/*
a327c341dc65e3 Ming Lei          2022-05-12  1283  	 * iopoll requires requ=
est to be submitted to driver, so can't
a327c341dc65e3 Ming Lei          2022-05-12  1284  	 * use plug
a327c341dc65e3 Ming Lei          2022-05-12  1285  	 */
4054cff92c3578 Christoph Hellwig 2021-11-17  1286  	rq->end_io_data =3D &wa=
it;
a327c341dc65e3 Ming Lei          2022-05-12  1287  	__blk_execute_rq_nowait=
(rq, at_head, blk_end_sync_rq,
a327c341dc65e3 Ming Lei          2022-05-12  1288  			!blk_rq_is_poll(rq));
4054cff92c3578 Christoph Hellwig 2021-11-17  1289  =

4054cff92c3578 Christoph Hellwig 2021-11-17  1290  	/* Prevent hang_check t=
imer from firing at us during very long I/O */
4054cff92c3578 Christoph Hellwig 2021-11-17  1291  	hang_check =3D sysctl_h=
ung_task_timeout_secs;
4054cff92c3578 Christoph Hellwig 2021-11-17  1292  =

4054cff92c3578 Christoph Hellwig 2021-11-17  1293  	if (blk_rq_is_poll(rq))
4054cff92c3578 Christoph Hellwig 2021-11-17  1294  		blk_rq_poll_completion=
(rq, &wait);
4054cff92c3578 Christoph Hellwig 2021-11-17  1295  	else if (hang_check)
4054cff92c3578 Christoph Hellwig 2021-11-17  1296  		while (!wait_for_compl=
etion_io_timeout(&wait,
4054cff92c3578 Christoph Hellwig 2021-11-17  1297  				hang_check * (HZ/2)))
4054cff92c3578 Christoph Hellwig 2021-11-17  1298  			;
4054cff92c3578 Christoph Hellwig 2021-11-17  1299  	else
4054cff92c3578 Christoph Hellwig 2021-11-17  1300  		wait_for_completion_io=
(&wait);
4054cff92c3578 Christoph Hellwig 2021-11-17  1301  =

4054cff92c3578 Christoph Hellwig 2021-11-17 @1302  	return (blk_status_t)(u=
intptr_t)rq->end_io_data;
4054cff92c3578 Christoph Hellwig 2021-11-17  1303  }
4054cff92c3578 Christoph Hellwig 2021-11-17  1304  EXPORT_SYMBOL(blk_execut=
e_rq);
4054cff92c3578 Christoph Hellwig 2021-11-17  1305  =


:::::: The code at line 1302 was first introduced by commit
:::::: 4054cff92c357813b6861b622122b344990f7e31 block: remove blk-exec.c

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8327660654167119748==--

