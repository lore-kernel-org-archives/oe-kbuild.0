Content-Type: multipart/mixed; boundary="===============6775185425173840490=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [colyli-bcache:for-next 11/12] drivers/md/bcache/journal.c:123:27: warning: Access to field 'keys' results in a dereference of an undefined pointer value (loaded from variable 'j') [clang-analyzer-core.NullDereference]
Date: Sat, 27 Nov 2021 23:40:10 +0800
Message-ID: <202111272324.PLz6BU1S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6775185425173840490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Coly Li <colyli@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache=
.git for-next
head:   d521ed6f859f0027a89ca40c1ce17240f8e118f4
commit: d5532e5a2b74d5c4ff9b847f89720c146599f700 [11/12] bcache: read jset =
from NVDIMM pages for journal replay
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-c001-20211126 (https://download.01.org/0day-ci/arch=
ive/20211127/202111272324.PLz6BU1S-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcac=
he.git/commit/?id=3Dd5532e5a2b74d5c4ff9b847f89720c146599f700
        git remote add colyli-bcache https://git.kernel.org/pub/scm/linux/k=
ernel/git/colyli/linux-bcache.git
        git fetch --no-tags colyli-bcache for-next
        git checkout d5532e5a2b74d5c4ff9b847f89720c146599f700
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                   ^
   drivers/usb/core/urb.c:1014:3: note: Loop condition is true.  Entering l=
oop body
                   while (!list_empty(&anchor->urb_list)) {
                   ^
   drivers/usb/core/urb.c:1017:4: note: Calling '__usb_unanchor_urb'
                           __usb_unanchor_urb(victim, anchor);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/urb.c:153:2: note: Calling 'usb_free_urb'
           usb_put_urb(urb);
           ^
   include/linux/usb.h:1723:21: note: expanded from macro 'usb_put_urb'
   #define usb_put_urb usb_free_urb
                       ^
   drivers/usb/core/urb.c:95:6: note: 'urb' is non-null
           if (urb)
               ^~~
   drivers/usb/core/urb.c:95:2: note: Taking true branch
           if (urb)
           ^
   drivers/usb/core/urb.c:96:3: note: Calling 'kref_put'
                   kref_put(&urb->kref, urb_destroy);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'urb_destroy'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/core/urb.c:23:6: note: Assuming the condition is false
           if (urb->transfer_flags & URB_FREE_BUFFER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/urb.c:23:2: note: Taking false branch
           if (urb->transfer_flags & URB_FREE_BUFFER)
           ^
   drivers/usb/core/urb.c:26:2: note: Memory is released
           kfree(urb);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/core/urb.c:96:3: note: Returning; memory was released
                   kref_put(&urb->kref, urb_destroy);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/urb.c:153:2: note: Returning; memory was released
           usb_put_urb(urb);
           ^
   include/linux/usb.h:1723:21: note: expanded from macro 'usb_put_urb'
   #define usb_put_urb usb_free_urb
                       ^
   drivers/usb/core/urb.c:154:2: note: Taking false branch
           if (usb_anchor_check_wakeup(anchor))
           ^
   drivers/usb/core/urb.c:1017:4: note: Returning; memory was released
                           __usb_unanchor_urb(victim, anchor);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/urb.c:1014:3: note: Loop condition is true.  Entering l=
oop body
                   while (!list_empty(&anchor->urb_list)) {
                   ^
   drivers/usb/core/urb.c:1017:4: note: Calling '__usb_unanchor_urb'
                           __usb_unanchor_urb(victim, anchor);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/urb.c:151:14: note: Use of memory after it is freed
           urb->anchor =3D NULL;
           ~~~~~~~~~~~ ^
   2 warnings generated.
   kernel/irq/irqdomain.c:618:2: warning: Value stored to 'of_node' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           of_node =3D irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/irqdomain.c:618:2: note: Value stored to 'of_node' is never r=
ead
           of_node =3D irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
   kernel/rcu/tree.c:279:2: warning: Value stored to 'seq' is never read [c=
lang-analyzer-deadcode.DeadStores]
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:279:2: note: Value stored to 'seq' is never read
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:298:2: warning: Value stored to 'seq' is never read [c=
lang-analyzer-deadcode.DeadStores]
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:298:2: note: Value stored to 'seq' is never read
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:2360:19: warning: Value stored to 'rnp' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rcu_node *rnp =3D rdp->mynode;
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2360:19: note: Value stored to 'rnp' during its initia=
lization is never read
           struct rcu_node *rnp =3D rdp->mynode;
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2425:19: warning: Value stored to 'rnp' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rcu_node *rnp =3D rdp->mynode;  /* Outgoing CPU's rdp & r=
np. */
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2425:19: note: Value stored to 'rnp' during its initia=
lization is never read
           struct rcu_node *rnp =3D rdp->mynode;  /* Outgoing CPU's rdp & r=
np. */
                            ^~~   ~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/md/bcache/journal.c:123:27: warning: Access to field 'keys' resu=
lts in a dereference of an undefined pointer value (loaded from variable 'j=
') [clang-analyzer-core.NullDereference]
                           size_t blocks, bytes =3D set_bytes(j);
                                                  ^
   drivers/md/bcache/bset.h:262:23: note: expanded from macro 'set_bytes'
   #define set_bytes(i)            __set_bytes(i, i->keys)
                                   ^
   drivers/md/bcache/bset.h:261:43: note: expanded from macro '__set_bytes'
   #define __set_bytes(i, k)       (sizeof(*(i)) + (k) * sizeof(uint64_t))
                                                   ^
   drivers/md/bcache/journal.c:240:2: note: Taking false branch
           if (bch_has_feature_nvdimm_meta(&ca->sb)) {
           ^
   drivers/md/bcache/journal.c:246:2: note: Taking false branch
           pr_debug("%u journal buckets\n", ca->sb.njournal_buckets);
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/md/bcache/journal.c:252:14: note: Assuming 'i' is < field 'njour=
nal_buckets'
           for (i =3D 0; i < ca->sb.njournal_buckets; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/journal.c:252:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < ca->sb.njournal_buckets; i++) {
           ^
   drivers/md/bcache/journal.c:260:7: note: Assuming the condition is true
                   if (test_bit(l, bitmap))
                       ^~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/journal.c:260:3: note: Taking true branch
                   if (test_bit(l, bitmap))
                   ^
   drivers/md/bcache/journal.c:261:4: note:  Execution continues on line 271
                           break;
                           ^
   drivers/md/bcache/journal.c:271:2: note: Taking false branch
           pr_debug("falling back to linear search\n");
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/md/bcache/journal.c:273:2: note: Assuming 'l' is < field 'njourn=
al_buckets'
           for_each_clear_bit(l, bitmap, ca->sb.njournal_buckets)
           ^
   include/linux/bitops.h:48:7: note: expanded from macro 'for_each_clear_b=
it'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/md/bcache/journal.c:273:2: note: Loop condition is true.  Enteri=
ng loop body
           for_each_clear_bit(l, bitmap, ca->sb.njournal_buckets)
           ^
   include/linux/bitops.h:47:2: note: expanded from macro 'for_each_clear_b=
it'
           for ((bit) =3D find_first_zero_bit((addr), (size));       \
           ^
   drivers/md/bcache/journal.c:274:7: note: 'ret' is >=3D 0
                   if (read_bucket(l))
                       ^
   drivers/md/bcache/journal.c:224:7: note: expanded from macro 'read_bucke=
t'
                   if (ret < 0)                                            \
                       ^~~
   drivers/md/bcache/journal.c:274:7: note: Taking false branch
                   if (read_bucket(l))
                       ^
   drivers/md/bcache/journal.c:224:3: note: expanded from macro 'read_bucke=
t'
                   if (ret < 0)                                            \
                   ^
   drivers/md/bcache/journal.c:274:3: note: Taking false branch
                   if (read_bucket(l))
                   ^
   drivers/md/bcache/journal.c:273:2: note: Assuming 'l' is < field 'njourn=
al_buckets'
           for_each_clear_bit(l, bitmap, ca->sb.njournal_buckets)
           ^
   include/linux/bitops.h:48:7: note: expanded from macro 'for_each_clear_b=
it'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/md/bcache/journal.c:273:2: note: Loop condition is true.  Enteri=
ng loop body
           for_each_clear_bit(l, bitmap, ca->sb.njournal_buckets)
           ^
   include/linux/bitops.h:47:2: note: expanded from macro 'for_each_clear_b=
it'
           for ((bit) =3D find_first_zero_bit((addr), (size));       \
           ^
   drivers/md/bcache/journal.c:274:7: note: Calling 'journal_read_bucket'
                   if (read_bucket(l))
                       ^
   drivers/md/bcache/journal.c:222:9: note: expanded from macro 'read_bucke=
t'
                   ret =3D journal_read_bucket(ca, list, b);               =
  \
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/journal.c:87:2: note: 'j' declared without an initial =
value
           struct jset *j;
           ^~~~~~~~~~~~~~
   drivers/md/bcache/journal.c:94:2: note: Taking false branch
           pr_debug("reading %u\n", bucket_index);
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \

vim +123 drivers/md/bcache/journal.c

cafe563591446c Kent Overstreet   2013-03-23  115  =

cafe563591446c Kent Overstreet   2013-03-23  116  		/* This function could =
be simpler now since we no longer write
cafe563591446c Kent Overstreet   2013-03-23  117  		 * journal entries that=
 overlap bucket boundaries; this means
cafe563591446c Kent Overstreet   2013-03-23  118  		 * the start of a bucke=
t will always have a valid journal entry
cafe563591446c Kent Overstreet   2013-03-23  119  		 * if it has any journa=
l entries at all.
cafe563591446c Kent Overstreet   2013-03-23  120  		 */
cafe563591446c Kent Overstreet   2013-03-23  121  		while (len) {
cafe563591446c Kent Overstreet   2013-03-23  122  			struct list_head *wher=
e;
cafe563591446c Kent Overstreet   2013-03-23 @123  			size_t blocks, bytes =
=3D set_bytes(j);
cafe563591446c Kent Overstreet   2013-03-23  124  =

b3fa7e77e67e64 Kent Overstreet   2013-08-05  125  			if (j->magic !=3D jset=
_magic(&ca->sb)) {
46f5aa8806e34f Joe Perches       2020-05-27  126  				pr_debug("%u: bad mag=
ic\n", bucket_index);
cafe563591446c Kent Overstreet   2013-03-23  127  				return ret;
b3fa7e77e67e64 Kent Overstreet   2013-08-05  128  			}
cafe563591446c Kent Overstreet   2013-03-23  129  =

b3fa7e77e67e64 Kent Overstreet   2013-08-05  130  			if (bytes > left << 9 =
||
b3fa7e77e67e64 Kent Overstreet   2013-08-05  131  			    bytes > PAGE_SIZE =
<< JSET_BITS) {
46f5aa8806e34f Joe Perches       2020-05-27  132  				pr_info("%u: too big,=
 %zu bytes, offset %u\n",
b3fa7e77e67e64 Kent Overstreet   2013-08-05  133  					bucket_index, bytes,=
 offset);
cafe563591446c Kent Overstreet   2013-03-23  134  				return ret;
b3fa7e77e67e64 Kent Overstreet   2013-08-05  135  			}
cafe563591446c Kent Overstreet   2013-03-23  136  =

cafe563591446c Kent Overstreet   2013-03-23  137  			if (bytes > len << 9)
cafe563591446c Kent Overstreet   2013-03-23  138  				goto reread;
cafe563591446c Kent Overstreet   2013-03-23  139  =

b3fa7e77e67e64 Kent Overstreet   2013-08-05  140  			if (j->csum !=3D csum_=
set(j)) {
46f5aa8806e34f Joe Perches       2020-05-27  141  				pr_info("%u: bad csum=
, %zu bytes, offset %u\n",
b3fa7e77e67e64 Kent Overstreet   2013-08-05  142  					bucket_index, bytes,=
 offset);
cafe563591446c Kent Overstreet   2013-03-23  143  				return ret;
b3fa7e77e67e64 Kent Overstreet   2013-08-05  144  			}
cafe563591446c Kent Overstreet   2013-03-23  145  =

4e1ebae3ee4e0c Coly Li           2020-10-01  146  			blocks =3D set_blocks(=
j, block_bytes(ca));
cafe563591446c Kent Overstreet   2013-03-23  147  =

2464b693148e5d Coly Li           2019-06-28  148  			/*
2464b693148e5d Coly Li           2019-06-28  149  			 * Nodes in 'list' are=
 in linear increasing order of
2464b693148e5d Coly Li           2019-06-28  150  			 * i->j.seq, the node =
on head has the smallest (oldest)
2464b693148e5d Coly Li           2019-06-28  151  			 * journal seq, the no=
de on tail has the biggest
2464b693148e5d Coly Li           2019-06-28  152  			 * (latest) journal se=
q.
2464b693148e5d Coly Li           2019-06-28  153  			 */
2464b693148e5d Coly Li           2019-06-28  154  =

2464b693148e5d Coly Li           2019-06-28  155  			/*
2464b693148e5d Coly Li           2019-06-28  156  			 * Check from the olde=
st jset for last_seq. If
2464b693148e5d Coly Li           2019-06-28  157  			 * i->j.seq < j->last_=
seq, it means the oldest jset
2464b693148e5d Coly Li           2019-06-28  158  			 * in list is expired =
and useless, remove it from
9c9b81c45619e7 Bhaskar Chowdhury 2021-04-11  159  			 * this list. Otherwis=
e, j is a candidate jset for
2464b693148e5d Coly Li           2019-06-28  160  			 * further following c=
hecks.
2464b693148e5d Coly Li           2019-06-28  161  			 */
cafe563591446c Kent Overstreet   2013-03-23  162  			while (!list_empty(lis=
t)) {
cafe563591446c Kent Overstreet   2013-03-23  163  				i =3D list_first_entr=
y(list,
cafe563591446c Kent Overstreet   2013-03-23  164  					struct journal_repla=
y, list);
cafe563591446c Kent Overstreet   2013-03-23  165  				if (i->j.seq >=3D j->=
last_seq)
cafe563591446c Kent Overstreet   2013-03-23  166  					break;
cafe563591446c Kent Overstreet   2013-03-23  167  				list_del(&i->list);
cafe563591446c Kent Overstreet   2013-03-23  168  				kfree(i);
cafe563591446c Kent Overstreet   2013-03-23  169  			}
cafe563591446c Kent Overstreet   2013-03-23  170  =

2464b693148e5d Coly Li           2019-06-28  171  			/* iterate list in rev=
erse order (from latest jset) */
cafe563591446c Kent Overstreet   2013-03-23  172  			list_for_each_entry_re=
verse(i, list, list) {
cafe563591446c Kent Overstreet   2013-03-23  173  				if (j->seq =3D=3D i->=
j.seq)
cafe563591446c Kent Overstreet   2013-03-23  174  					goto next_set;
cafe563591446c Kent Overstreet   2013-03-23  175  =

2464b693148e5d Coly Li           2019-06-28  176  				/*
2464b693148e5d Coly Li           2019-06-28  177  				 * if j->seq is less =
than any i->j.last_seq
2464b693148e5d Coly Li           2019-06-28  178  				 * in list, j is an e=
xpired and useless jset.
2464b693148e5d Coly Li           2019-06-28  179  				 */
cafe563591446c Kent Overstreet   2013-03-23  180  				if (j->seq < i->j.las=
t_seq)
cafe563591446c Kent Overstreet   2013-03-23  181  					goto next_set;
cafe563591446c Kent Overstreet   2013-03-23  182  =

2464b693148e5d Coly Li           2019-06-28  183  				/*
2464b693148e5d Coly Li           2019-06-28  184  				 * 'where' points to =
first jset in list which
2464b693148e5d Coly Li           2019-06-28  185  				 * is elder then j.
2464b693148e5d Coly Li           2019-06-28  186  				 */
cafe563591446c Kent Overstreet   2013-03-23  187  				if (j->seq > i->j.seq=
) {
cafe563591446c Kent Overstreet   2013-03-23  188  					where =3D &i->list;
cafe563591446c Kent Overstreet   2013-03-23  189  					goto add;
cafe563591446c Kent Overstreet   2013-03-23  190  				}
cafe563591446c Kent Overstreet   2013-03-23  191  			}
cafe563591446c Kent Overstreet   2013-03-23  192  =

cafe563591446c Kent Overstreet   2013-03-23  193  			where =3D list;
cafe563591446c Kent Overstreet   2013-03-23  194  add:
cafe563591446c Kent Overstreet   2013-03-23  195  			i =3D kmalloc(offsetof=
(struct journal_replay, j) +
cafe563591446c Kent Overstreet   2013-03-23  196  				    bytes, GFP_KERNEL=
);
cafe563591446c Kent Overstreet   2013-03-23  197  			if (!i)
cafe563591446c Kent Overstreet   2013-03-23  198  				return -ENOMEM;
cafe563591446c Kent Overstreet   2013-03-23  199  			memcpy(&i->j, j, bytes=
);
2464b693148e5d Coly Li           2019-06-28  200  			/* Add to the location=
 after 'where' points to */
cafe563591446c Kent Overstreet   2013-03-23  201  			list_add(&i->list, whe=
re);
cafe563591446c Kent Overstreet   2013-03-23  202  			ret =3D 1;
cafe563591446c Kent Overstreet   2013-03-23  203  =

a231f07a5fe30a Coly Li           2019-06-28  204  			if (j->seq > ja->seq[b=
ucket_index])
cafe563591446c Kent Overstreet   2013-03-23  205  				ja->seq[bucket_index]=
 =3D j->seq;
cafe563591446c Kent Overstreet   2013-03-23  206  next_set:
cafe563591446c Kent Overstreet   2013-03-23  207  			offset	+=3D blocks * c=
a->sb.block_size;
cafe563591446c Kent Overstreet   2013-03-23  208  			len	-=3D blocks * ca->=
sb.block_size;
cafe563591446c Kent Overstreet   2013-03-23  209  			j =3D ((void *) j) + b=
locks * block_bytes(ca);
cafe563591446c Kent Overstreet   2013-03-23  210  		}
cafe563591446c Kent Overstreet   2013-03-23  211  	}
cafe563591446c Kent Overstreet   2013-03-23  212  =

cafe563591446c Kent Overstreet   2013-03-23  213  	return ret;
cafe563591446c Kent Overstreet   2013-03-23  214  }
cafe563591446c Kent Overstreet   2013-03-23  215  =


:::::: The code at line 123 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6775185425173840490==--

