Content-Type: multipart/mixed; boundary="===============8740158021435506350=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [colyli-bcache:for-next 11/12] drivers/md/bcache/journal.c:123 journal_read_bucket() error: potentially dereferencing uninitialized 'j'.
Date: Sat, 27 Nov 2021 17:01:49 +0800
Message-ID: <202111271648.JkaC3FMt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8740158021435506350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Coly Li <colyli@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache=
.git for-next
head:   d521ed6f859f0027a89ca40c1ce17240f8e118f4
commit: d5532e5a2b74d5c4ff9b847f89720c146599f700 [11/12] bcache: read jset =
from NVDIMM pages for journal replay
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-m021-20211126 (https://download.01.org/0day-ci/arch=
ive/20211127/202111271648.JkaC3FMt-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/md/bcache/journal.c:123 journal_read_bucket() error: potentially de=
referencing uninitialized 'j'.

vim +/j +123 drivers/md/bcache/journal.c

cafe563591446cf Kent Overstreet   2013-03-23  115  =

cafe563591446cf Kent Overstreet   2013-03-23  116  		/* This function could=
 be simpler now since we no longer write
cafe563591446cf Kent Overstreet   2013-03-23  117  		 * journal entries tha=
t overlap bucket boundaries; this means
cafe563591446cf Kent Overstreet   2013-03-23  118  		 * the start of a buck=
et will always have a valid journal entry
cafe563591446cf Kent Overstreet   2013-03-23  119  		 * if it has any journ=
al entries at all.
cafe563591446cf Kent Overstreet   2013-03-23  120  		 */
cafe563591446cf Kent Overstreet   2013-03-23  121  		while (len) {
cafe563591446cf Kent Overstreet   2013-03-23  122  			struct list_head *whe=
re;
cafe563591446cf Kent Overstreet   2013-03-23 @123  			size_t blocks, bytes =
=3D set_bytes(j);
cafe563591446cf Kent Overstreet   2013-03-23  124  =

b3fa7e77e67e647 Kent Overstreet   2013-08-05  125  			if (j->magic !=3D jse=
t_magic(&ca->sb)) {
46f5aa8806e34f2 Joe Perches       2020-05-27  126  				pr_debug("%u: bad ma=
gic\n", bucket_index);
cafe563591446cf Kent Overstreet   2013-03-23  127  				return ret;
b3fa7e77e67e647 Kent Overstreet   2013-08-05  128  			}
cafe563591446cf Kent Overstreet   2013-03-23  129  =

b3fa7e77e67e647 Kent Overstreet   2013-08-05  130  			if (bytes > left << 9=
 ||
b3fa7e77e67e647 Kent Overstreet   2013-08-05  131  			    bytes > PAGE_SIZE=
 << JSET_BITS) {
46f5aa8806e34f2 Joe Perches       2020-05-27  132  				pr_info("%u: too big=
, %zu bytes, offset %u\n",
b3fa7e77e67e647 Kent Overstreet   2013-08-05  133  					bucket_index, bytes=
, offset);
cafe563591446cf Kent Overstreet   2013-03-23  134  				return ret;
b3fa7e77e67e647 Kent Overstreet   2013-08-05  135  			}
cafe563591446cf Kent Overstreet   2013-03-23  136  =

cafe563591446cf Kent Overstreet   2013-03-23  137  			if (bytes > len << 9)
cafe563591446cf Kent Overstreet   2013-03-23  138  				goto reread;
cafe563591446cf Kent Overstreet   2013-03-23  139  =

b3fa7e77e67e647 Kent Overstreet   2013-08-05  140  			if (j->csum !=3D csum=
_set(j)) {
46f5aa8806e34f2 Joe Perches       2020-05-27  141  				pr_info("%u: bad csu=
m, %zu bytes, offset %u\n",
b3fa7e77e67e647 Kent Overstreet   2013-08-05  142  					bucket_index, bytes=
, offset);
cafe563591446cf Kent Overstreet   2013-03-23  143  				return ret;
b3fa7e77e67e647 Kent Overstreet   2013-08-05  144  			}
cafe563591446cf Kent Overstreet   2013-03-23  145  =

4e1ebae3ee4e0ce Coly Li           2020-10-01  146  			blocks =3D set_blocks=
(j, block_bytes(ca));
cafe563591446cf Kent Overstreet   2013-03-23  147  =

2464b693148e5d5 Coly Li           2019-06-28  148  			/*
2464b693148e5d5 Coly Li           2019-06-28  149  			 * Nodes in 'list' ar=
e in linear increasing order of
2464b693148e5d5 Coly Li           2019-06-28  150  			 * i->j.seq, the node=
 on head has the smallest (oldest)
2464b693148e5d5 Coly Li           2019-06-28  151  			 * journal seq, the n=
ode on tail has the biggest
2464b693148e5d5 Coly Li           2019-06-28  152  			 * (latest) journal s=
eq.
2464b693148e5d5 Coly Li           2019-06-28  153  			 */
2464b693148e5d5 Coly Li           2019-06-28  154  =

2464b693148e5d5 Coly Li           2019-06-28  155  			/*
2464b693148e5d5 Coly Li           2019-06-28  156  			 * Check from the old=
est jset for last_seq. If
2464b693148e5d5 Coly Li           2019-06-28  157  			 * i->j.seq < j->last=
_seq, it means the oldest jset
2464b693148e5d5 Coly Li           2019-06-28  158  			 * in list is expired=
 and useless, remove it from
9c9b81c45619e76 Bhaskar Chowdhury 2021-04-11  159  			 * this list. Otherwi=
se, j is a candidate jset for
2464b693148e5d5 Coly Li           2019-06-28  160  			 * further following =
checks.
2464b693148e5d5 Coly Li           2019-06-28  161  			 */
cafe563591446cf Kent Overstreet   2013-03-23  162  			while (!list_empty(li=
st)) {
cafe563591446cf Kent Overstreet   2013-03-23  163  				i =3D list_first_ent=
ry(list,
cafe563591446cf Kent Overstreet   2013-03-23  164  					struct journal_repl=
ay, list);
cafe563591446cf Kent Overstreet   2013-03-23  165  				if (i->j.seq >=3D j-=
>last_seq)
cafe563591446cf Kent Overstreet   2013-03-23  166  					break;
cafe563591446cf Kent Overstreet   2013-03-23  167  				list_del(&i->list);
cafe563591446cf Kent Overstreet   2013-03-23  168  				kfree(i);
cafe563591446cf Kent Overstreet   2013-03-23  169  			}
cafe563591446cf Kent Overstreet   2013-03-23  170  =

2464b693148e5d5 Coly Li           2019-06-28  171  			/* iterate list in re=
verse order (from latest jset) */
cafe563591446cf Kent Overstreet   2013-03-23  172  			list_for_each_entry_r=
everse(i, list, list) {
cafe563591446cf Kent Overstreet   2013-03-23  173  				if (j->seq =3D=3D i-=
>j.seq)
cafe563591446cf Kent Overstreet   2013-03-23  174  					goto next_set;
cafe563591446cf Kent Overstreet   2013-03-23  175  =

2464b693148e5d5 Coly Li           2019-06-28  176  				/*
2464b693148e5d5 Coly Li           2019-06-28  177  				 * if j->seq is less=
 than any i->j.last_seq
2464b693148e5d5 Coly Li           2019-06-28  178  				 * in list, j is an =
expired and useless jset.
2464b693148e5d5 Coly Li           2019-06-28  179  				 */
cafe563591446cf Kent Overstreet   2013-03-23  180  				if (j->seq < i->j.la=
st_seq)
cafe563591446cf Kent Overstreet   2013-03-23  181  					goto next_set;
cafe563591446cf Kent Overstreet   2013-03-23  182  =

2464b693148e5d5 Coly Li           2019-06-28  183  				/*
2464b693148e5d5 Coly Li           2019-06-28  184  				 * 'where' points to=
 first jset in list which
2464b693148e5d5 Coly Li           2019-06-28  185  				 * is elder then j.
2464b693148e5d5 Coly Li           2019-06-28  186  				 */
cafe563591446cf Kent Overstreet   2013-03-23  187  				if (j->seq > i->j.se=
q) {
cafe563591446cf Kent Overstreet   2013-03-23  188  					where =3D &i->list;
cafe563591446cf Kent Overstreet   2013-03-23  189  					goto add;
cafe563591446cf Kent Overstreet   2013-03-23  190  				}
cafe563591446cf Kent Overstreet   2013-03-23  191  			}
cafe563591446cf Kent Overstreet   2013-03-23  192  =

cafe563591446cf Kent Overstreet   2013-03-23  193  			where =3D list;
cafe563591446cf Kent Overstreet   2013-03-23  194  add:
cafe563591446cf Kent Overstreet   2013-03-23  195  			i =3D kmalloc(offseto=
f(struct journal_replay, j) +
cafe563591446cf Kent Overstreet   2013-03-23  196  				    bytes, GFP_KERNE=
L);
cafe563591446cf Kent Overstreet   2013-03-23  197  			if (!i)
cafe563591446cf Kent Overstreet   2013-03-23  198  				return -ENOMEM;
cafe563591446cf Kent Overstreet   2013-03-23  199  			memcpy(&i->j, j, byte=
s);
2464b693148e5d5 Coly Li           2019-06-28  200  			/* Add to the locatio=
n after 'where' points to */
cafe563591446cf Kent Overstreet   2013-03-23  201  			list_add(&i->list, wh=
ere);
cafe563591446cf Kent Overstreet   2013-03-23  202  			ret =3D 1;
cafe563591446cf Kent Overstreet   2013-03-23  203  =

a231f07a5fe30a5 Coly Li           2019-06-28  204  			if (j->seq > ja->seq[=
bucket_index])
cafe563591446cf Kent Overstreet   2013-03-23  205  				ja->seq[bucket_index=
] =3D j->seq;
cafe563591446cf Kent Overstreet   2013-03-23  206  next_set:
cafe563591446cf Kent Overstreet   2013-03-23  207  			offset	+=3D blocks * =
ca->sb.block_size;
cafe563591446cf Kent Overstreet   2013-03-23  208  			len	-=3D blocks * ca-=
>sb.block_size;
cafe563591446cf Kent Overstreet   2013-03-23  209  			j =3D ((void *) j) + =
blocks * block_bytes(ca);
cafe563591446cf Kent Overstreet   2013-03-23  210  		}
cafe563591446cf Kent Overstreet   2013-03-23  211  	}
cafe563591446cf Kent Overstreet   2013-03-23  212  =

cafe563591446cf Kent Overstreet   2013-03-23  213  	return ret;
cafe563591446cf Kent Overstreet   2013-03-23  214  }
cafe563591446cf Kent Overstreet   2013-03-23  215  =


:::::: The code at line 123 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8740158021435506350==--

