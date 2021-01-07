Content-Type: multipart/mixed; boundary="===============5195811738515817420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC 3/3] mm, slub: stop freeing kmem_cache_node structures on node offline
Date: Thu, 07 Jan 2021 08:44:26 +0800
Message-ID: <202101070848.4ilRYloo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5195811738515817420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210106174029.12654-4-vbabka@suse.cz>
References: <20210106174029.12654-4-vbabka@suse.cz>
TO: Vlastimil Babka <vbabka@suse.cz>

Hi Vlastimil,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on linus/master hnaz-linux-mm/master v5.11-rc2 nex=
t-20210104]
[cannot apply to mmotm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vlastimil-Babka/mm-slab-sl=
ub-remove-cpu-and-memory-hotplug-locks/20210107-014224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
09162bc32c880a791c6c0668ce0745cf7958f576
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/slub.c:4223:26: warning: Unused variable: n [unusedVariable]
    struct kmem_cache_node *n;
                            ^
>> mm/slub.c:4224:21: warning: Unused variable: s [unusedVariable]
    struct kmem_cache *s;
                       ^
   mm/slub.c:5581:4: warning: Either the condition '!name' is redundant or =
there is pointer arithmetic with NULL pointer. [nullPointerArithmeticRedund=
antCheck]
    *p++ =3D ':';
      ^
   mm/slub.c:5579:9: note: Assuming that condition '!name' is not redundant
    BUG_ON(!name);
           ^
   mm/slub.c:5577:12: note: Assignment 'p=3Dname', assigned value is 0
    char *p =3D name;
              ^
   mm/slub.c:5581:4: note: Null pointer addition
    *p++ =3D ':';
      ^

vim +4223 mm/slub.c

b9049e234401e1 Yasunori Goto     2007-10-21  4220  =

b9049e234401e1 Yasunori Goto     2007-10-21  4221  static void slab_mem_off=
line_callback(void *arg)
b9049e234401e1 Yasunori Goto     2007-10-21  4222  {
b9049e234401e1 Yasunori Goto     2007-10-21 @4223  	struct kmem_cache_node =
*n;
b9049e234401e1 Yasunori Goto     2007-10-21 @4224  	struct kmem_cache *s;
b9049e234401e1 Yasunori Goto     2007-10-21  4225  	struct memory_notify *m=
arg =3D arg;
b9049e234401e1 Yasunori Goto     2007-10-21  4226  	int offline_node;
b9049e234401e1 Yasunori Goto     2007-10-21  4227  =

b9d5ab2562ecee Lai Jiangshan     2012-12-11  4228  	offline_node =3D marg->=
status_change_nid_normal;
b9049e234401e1 Yasunori Goto     2007-10-21  4229  =

b9049e234401e1 Yasunori Goto     2007-10-21  4230  	/*
b9049e234401e1 Yasunori Goto     2007-10-21  4231  	 * If the node still ha=
s available memory. we need kmem_cache_node
b9049e234401e1 Yasunori Goto     2007-10-21  4232  	 * for it yet.
b9049e234401e1 Yasunori Goto     2007-10-21  4233  	 */
b9049e234401e1 Yasunori Goto     2007-10-21  4234  	if (offline_node < 0)
b9049e234401e1 Yasunori Goto     2007-10-21  4235  		return;
b9049e234401e1 Yasunori Goto     2007-10-21  4236  =

18004c5d4084d9 Christoph Lameter 2012-07-06  4237  	mutex_lock(&slab_mutex);
27153f04e4a5f9 Vlastimil Babka   2021-01-06  4238  	node_clear(offline_node=
, slab_nodes);
b9049e234401e1 Yasunori Goto     2007-10-21  4239  	/*
9d5e878e997461 Vlastimil Babka   2021-01-06  4240  	 * We no longer free km=
em_cache_node structures here, as it would be
9d5e878e997461 Vlastimil Babka   2021-01-06  4241  	 * racy with all get_no=
de() users, and infeasible to protect them with
9d5e878e997461 Vlastimil Babka   2021-01-06  4242  	 * slab_mutex.
b9049e234401e1 Yasunori Goto     2007-10-21  4243  	 */
18004c5d4084d9 Christoph Lameter 2012-07-06  4244  	mutex_unlock(&slab_mute=
x);
b9049e234401e1 Yasunori Goto     2007-10-21  4245  }
b9049e234401e1 Yasunori Goto     2007-10-21  4246  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5195811738515817420==--

