Content-Type: multipart/mixed; boundary="===============3116621129099268975=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH] ring-buffer: Have nested events still record running time stamp
Date: Fri, 26 Jun 2020 01:10:57 +0800
Message-ID: <202006260114.2iNNV1W3%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3116621129099268975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200625094454.732790f7@oasis.local.home>
References: <20200625094454.732790f7@oasis.local.home>
TO: Steven Rostedt <rostedt@goodmis.org>

Hi Steven,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/perf/core]
[also build test WARNING on linux/master linus/master v5.8-rc2 next-2020062=
5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Steven-Rostedt/ring-buffer=
-Have-nested-events-still-record-running-time-stamp/20200625-214744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git bb42b3d=
39781d7fcd3be7f9f9bf11b6661b5fdf1
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm-randconfig-s032-20200624 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-dirty
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Darm CF=3D'-fdiagnostic-prefix -D__CHECK_END=
IAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/trace/ring_buffer.c:485:41: sparse: sparse: expected ; at end of =
declaration
   kernel/trace/ring_buffer.c:485:41: sparse: sparse: Expected } at end of =
struct-union-enum-specifier
   kernel/trace/ring_buffer.c:485:41: sparse: sparse: got write_stamp
   kernel/trace/ring_buffer.c:495:1: sparse: sparse: Expected ; at the end =
of type declaration
   kernel/trace/ring_buffer.c:495:1: sparse: sparse: got }
   kernel/trace/ring_buffer.c:1715:50: sparse: sparse: no member 'update_pa=
ges_work' in struct ring_buffer_per_cpu
>> kernel/trace/ring_buffer.c:1715:50: sparse: sparse: unknown member
>> kernel/trace/ring_buffer.c:1715:50: sparse: sparse: cast from unknown ty=
pe
   kernel/trace/ring_buffer.c:1718:29: sparse: sparse: no member 'update_do=
ne' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:611:35: sparse: sparse: no member 'irq_work' =
in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:715:35: sparse: sparse: no member 'irq_work' =
in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1318:9: sparse: sparse: no member 'update_pag=
es_work' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1318:9: sparse: sparse: no member 'update_pag=
es_work' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1318:9: sparse: sparse: no member 'update_pag=
es_work' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1318:9: sparse: sparse: no member 'update_pag=
es_work' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1318:9: sparse: sparse: no member 'update_pag=
es_work' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1319:9: sparse: sparse: no member 'update_don=
e' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1320:34: sparse: sparse: no member 'irq_work'=
 in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1321:9: sparse: sparse: no member 'irq_work' =
in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1322:9: sparse: sparse: no member 'irq_work' =
in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1339:35: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:4559:35: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:4579:9: sparse: sparse: undefined identifier =
'local64_set'
   kernel/trace/ring_buffer.c:4580:19: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1625:46: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1690:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1690:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1690:17: sparse: sparse: cast from unknown ty=
pe
   kernel/trace/ring_buffer.c:1690:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1690:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1703:23: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1707:52: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1710:51: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1779:35: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1784:39: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1790:51: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1791:59: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1807:40: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1813:43: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1816:60: sparse: sparse: no member 'update_pa=
ges_work' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1823:40: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1827:64: sparse: sparse: no member 'update_do=
ne' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1828:35: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1852:27: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1855:43: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1856:31: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1870:53: sparse: sparse: no member 'update_pa=
ges_work' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1871:56: sparse: sparse: no member 'update_do=
ne' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1874:27: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1910:27: sparse: sparse: no member 'nr_pages_=
to_update' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1912:43: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1915:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1915:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1915:17: sparse: sparse: cast from unknown ty=
pe
   kernel/trace/ring_buffer.c:1915:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:1915:17: sparse: sparse: no member 'new_pages=
' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2890:9: sparse: sparse: undefined identifier =
'local64_read'
   kernel/trace/ring_buffer.c:2890:9: sparse: sparse: cast from unknown type
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: cast from unknown ty=
pe
>> kernel/trace/ring_buffer.c:2917:18: sparse: sparse: cannot dereference t=
his type
   kernel/trace/ring_buffer.c:2917:18: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2918:17: sparse: sparse: undefined identifier=
 'local64_read'
   kernel/trace/ring_buffer.c:2937:9: sparse: sparse: no member 'before_sta=
mp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2937:9: sparse: sparse: no member 'before_sta=
mp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2937:9: sparse: sparse: cast from unknown type
   kernel/trace/ring_buffer.c:2937:9: sparse: sparse: cannot dereference th=
is type
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
   kernel/trace/ring_buffer.c:2950:34: sparse: sparse: no member 'before_st=
amp' in struct ring_buffer_per_cpu
>> kernel/trace/ring_buffer.c:2950:34: sparse: sparse: too many errors

# https://github.com/0day-ci/linux/commit/9a8ccc67a4f2747143e5fadf7404172d9=
608cdb8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 9a8ccc67a4f2747143e5fadf7404172d9608cdb8
vim +485 kernel/trace/ring_buffer.c

a497adb45b8691f Steven Rostedt (Red Hat  2015-05-29  448) =

7a8e76a3829f106 Steven Rostedt           2008-09-29  449  /*
7a8e76a3829f106 Steven Rostedt           2008-09-29  450   * head_page =3D=
=3D tail_page && head =3D=3D tail then buffer is empty.
7a8e76a3829f106 Steven Rostedt           2008-09-29  451   */
7a8e76a3829f106 Steven Rostedt           2008-09-29  452  struct ring_buffe=
r_per_cpu {
7a8e76a3829f106 Steven Rostedt           2008-09-29  453  	int				cpu;
985023dee6e2124 Richard Kennedy          2010-03-25  454  	atomic_t			recor=
d_disabled;
07b8b10ec94f852 Steven Rostedt (VMware   2020-03-27  455) 	atomic_t			resiz=
e_disabled;
13292494379f92f Steven Rostedt (VMware   2019-12-13  456) 	struct trace_buf=
fer	*buffer;
5389f6fad27019f Thomas Gleixner          2009-07-25  457  	raw_spinlock_t		=
	reader_lock;	/* serialize readers */
445c89514be242b Thomas Gleixner          2009-12-02  458  	arch_spinlock_t	=
		lock;
7a8e76a3829f106 Steven Rostedt           2008-09-29  459  	struct lock_clas=
s_key		lock_key;
73a757e63114dfd Steven Rostedt (VMware   2017-05-01  460) 	struct buffer_da=
ta_page		*free_page;
9b94a8fba501f38 Steven Rostedt (Red Hat  2016-05-12  461) 	unsigned long			=
nr_pages;
58a09ec6e3ec88c Steven Rostedt (Red Hat  2015-05-27  462) 	unsigned int			c=
urrent_context;
3adc54fa82a68be Steven Rostedt           2009-03-30  463  	struct list_head=
		*pages;
6f807acd2773419 Steven Rostedt           2008-10-04  464  	struct buffer_pa=
ge		*head_page;	/* read from head */
6f807acd2773419 Steven Rostedt           2008-10-04  465  	struct buffer_pa=
ge		*tail_page;	/* write to tail */
c3706f005c3aaf5 Wenji Huang              2009-02-10  466  	struct buffer_pa=
ge		*commit_page;	/* committed pages */
d769041f8653300 Steven Rostedt           2008-10-01  467  	struct buffer_pa=
ge		*reader_page;
66a8cb95ed04025 Steven Rostedt           2010-03-31  468  	unsigned long			=
lost_events;
66a8cb95ed04025 Steven Rostedt           2010-03-31  469  	unsigned long			=
last_overrun;
8e012066fe0de5f Steven Rostedt (VMware   2018-02-07  470) 	unsigned long			=
nest;
c64e148a3be3cb7 Vaibhav Nagarnaik        2011-08-16  471  	local_t				entri=
es_bytes;
e4906eff9e6fbd2 Steven Rostedt           2009-04-30  472  	local_t				entri=
es;
884bfe89a462fcc Slava Pestov             2011-07-15  473  	local_t				overr=
un;
884bfe89a462fcc Slava Pestov             2011-07-15  474  	local_t				commi=
t_overrun;
884bfe89a462fcc Slava Pestov             2011-07-15  475  	local_t				dropp=
ed_events;
fa7439531dee582 Steven Rostedt           2009-06-16  476  	local_t				commi=
tting;
fa7439531dee582 Steven Rostedt           2009-06-16  477  	local_t				commi=
ts;
2c2b0a78b373908 Steven Rostedt (VMware   2018-11-29  478) 	local_t				pages=
_touched;
2c2b0a78b373908 Steven Rostedt (VMware   2018-11-29  479) 	local_t				pages=
_read;
03329f993978104 Steven Rostedt (VMware   2018-11-29  480) 	long				last_pag=
es_touch;
2c2b0a78b373908 Steven Rostedt (VMware   2018-11-29  481) 	size_t				shorte=
st_full;
77ae365eca89506 Steven Rostedt           2009-03-27  482  	unsigned long			=
read;
c64e148a3be3cb7 Vaibhav Nagarnaik        2011-08-16  483  	unsigned long			=
read_bytes;
9a8ccc67a4f2747 Steven Rostedt (VMware   2020-06-25  484) 	unsigned long			=
next_write;
9a8ccc67a4f2747 Steven Rostedt (VMware   2020-06-25 @485) 	local64_t			writ=
e_stamp;
7a8e76a3829f106 Steven Rostedt           2008-09-29  486  	u64				read_stam=
p;
9a8ccc67a4f2747 Steven Rostedt (VMware   2020-06-25  487) 	u64				before_st=
amp;
438ced1720b5840 Vaibhav Nagarnaik        2012-02-02  488  	/* ring buffer p=
ages to update, > 0 to add, < 0 to remove */
9b94a8fba501f38 Steven Rostedt (Red Hat  2016-05-12  489) 	long				nr_pages=
_to_update;
438ced1720b5840 Vaibhav Nagarnaik        2012-02-02  490  	struct list_head=
		new_pages; /* new pages to add */
83f40318dab00e3 Vaibhav Nagarnaik        2012-05-03  491  	struct work_stru=
ct		update_pages_work;
05fdd70d2fe1e34 Vaibhav Nagarnaik        2012-05-18  492  	struct completio=
n		update_done;
15693458c4bc069 Steven Rostedt (Red Hat  2013-02-28  493) =

15693458c4bc069 Steven Rostedt (Red Hat  2013-02-28  494) 	struct rb_irq_wo=
rk		irq_work;
7a8e76a3829f106 Steven Rostedt           2008-09-29  495  };
7a8e76a3829f106 Steven Rostedt           2008-09-29  496  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============3116621129099268975==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3116621129099268975==--

