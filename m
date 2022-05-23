Content-Type: multipart/mixed; boundary="===============4601313637347857966=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/locking/lockdep_proc.c:47:50: warning: Parameter 'pos' can be declared with const [constParameter]
Date: Mon, 23 May 2022 09:08:17 +0800
Message-ID: <202205230944.8NElrMrL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4601313637347857966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Waiman Long <longman@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b0986a3613c92f4ec1bdc7f60ec66fea135991f
commit: fb7275acd6fb988313dddd8d3d19efa70d9015ad locking/lockdep: Iterate l=
ock_classes directly when reading lockdep files
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fb7275acd6fb988313dddd8d3d19efa70d9015ad
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/locking/lockdep_proc.c:47:50: warning: Parameter 'pos' can be dec=
lared with const [constParameter]
   static void *l_start(struct seq_file *m, loff_t *pos)
                                                    ^
>> kernel/locking/lockdep_proc.c:196:27: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
    unsigned long long hi1 =3D debug_atomic_read(hardirqs_on_events),
                             ^
   kernel/locking/lockdep_proc.c:196:27: note: Address of variable taken he=
re.
    unsigned long long hi1 =3D debug_atomic_read(hardirqs_on_events),
                             ^
   kernel/locking/lockdep_proc.c:196:27: note: Temporary created here.
    unsigned long long hi1 =3D debug_atomic_read(hardirqs_on_events),
                             ^
   kernel/locking/lockdep_proc.c:196:27: note: Using pointer that is a temp=
orary.
    unsigned long long hi1 =3D debug_atomic_read(hardirqs_on_events),
                             ^
   kernel/locking/lockdep_proc.c:197:13: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
         hi2 =3D debug_atomic_read(hardirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:197:13: note: Address of variable taken he=
re.
         hi2 =3D debug_atomic_read(hardirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:197:13: note: Temporary created here.
         hi2 =3D debug_atomic_read(hardirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:197:13: note: Using pointer that is a temp=
orary.
         hi2 =3D debug_atomic_read(hardirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:198:13: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
         hr1 =3D debug_atomic_read(redundant_hardirqs_on),
               ^
   kernel/locking/lockdep_proc.c:198:13: note: Address of variable taken he=
re.
         hr1 =3D debug_atomic_read(redundant_hardirqs_on),
               ^
   kernel/locking/lockdep_proc.c:198:13: note: Temporary created here.
         hr1 =3D debug_atomic_read(redundant_hardirqs_on),
               ^
   kernel/locking/lockdep_proc.c:198:13: note: Using pointer that is a temp=
orary.
         hr1 =3D debug_atomic_read(redundant_hardirqs_on),
               ^
   kernel/locking/lockdep_proc.c:199:13: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
         hr2 =3D debug_atomic_read(redundant_hardirqs_off),
               ^
   kernel/locking/lockdep_proc.c:199:13: note: Address of variable taken he=
re.
         hr2 =3D debug_atomic_read(redundant_hardirqs_off),
               ^
   kernel/locking/lockdep_proc.c:199:13: note: Temporary created here.
         hr2 =3D debug_atomic_read(redundant_hardirqs_off),
               ^
   kernel/locking/lockdep_proc.c:199:13: note: Using pointer that is a temp=
orary.
         hr2 =3D debug_atomic_read(redundant_hardirqs_off),
               ^
   kernel/locking/lockdep_proc.c:200:13: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
         si1 =3D debug_atomic_read(softirqs_on_events),
               ^
   kernel/locking/lockdep_proc.c:200:13: note: Address of variable taken he=
re.
         si1 =3D debug_atomic_read(softirqs_on_events),
               ^
   kernel/locking/lockdep_proc.c:200:13: note: Temporary created here.
         si1 =3D debug_atomic_read(softirqs_on_events),
               ^
   kernel/locking/lockdep_proc.c:200:13: note: Using pointer that is a temp=
orary.
         si1 =3D debug_atomic_read(softirqs_on_events),
               ^
   kernel/locking/lockdep_proc.c:201:13: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
         si2 =3D debug_atomic_read(softirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:201:13: note: Address of variable taken he=
re.
         si2 =3D debug_atomic_read(softirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:201:13: note: Temporary created here.
         si2 =3D debug_atomic_read(softirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:201:13: note: Using pointer that is a temp=
orary.
         si2 =3D debug_atomic_read(softirqs_off_events),
               ^
   kernel/locking/lockdep_proc.c:202:13: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
         sr1 =3D debug_atomic_read(redundant_softirqs_on),
               ^
   kernel/locking/lockdep_proc.c:202:13: note: Address of variable taken he=
re.
         sr1 =3D debug_atomic_read(redundant_softirqs_on),
               ^
   kernel/locking/lockdep_proc.c:202:13: note: Temporary created here.
         sr1 =3D debug_atomic_read(redundant_softirqs_on),
               ^
   kernel/locking/lockdep_proc.c:202:13: note: Using pointer that is a temp=
orary.
         sr1 =3D debug_atomic_read(redundant_softirqs_on),
               ^
   kernel/locking/lockdep_proc.c:203:13: warning: Using pointer that is a t=
emporary. [danglingTemporaryLifetime]
         sr2 =3D debug_atomic_read(redundant_softirqs_off);
               ^
   kernel/locking/lockdep_proc.c:203:13: note: Address of variable taken he=
re.
         sr2 =3D debug_atomic_read(redundant_softirqs_off);
               ^
   kernel/locking/lockdep_proc.c:203:13: note: Temporary created here.
         sr2 =3D debug_atomic_read(redundant_softirqs_off);
               ^
   kernel/locking/lockdep_proc.c:203:13: note: Using pointer that is a temp=
orary.
         sr2 =3D debug_atomic_read(redundant_softirqs_off);
               ^
   kernel/locking/lockdep_proc.c:206:3: warning: Using pointer that is a te=
mporary. [danglingTemporaryLifetime]
     debug_atomic_read(chain_lookup_misses));
     ^
   kernel/locking/lockdep_proc.c:206:3: note: Address of variable taken her=
e.
     debug_atomic_read(chain_lookup_misses));
--
>> sound/soc/soc-component.c:276:13: warning: Parameter 'mark' can be decla=
red with const [constParameter]
         void *mark, int upon_open, int rollback)
               ^
>> sound/soc/soc-component.c:1215:14: warning: Parameter 'stream' can be de=
clared with const [constParameter]
          void *stream, int rollback)
                ^
--
>> sound/soc/codecs/wm8994.c:861:17: warning: String literal compared with =
variable 'NULL'. Did you intend to use strcmp() instead? [literalWithCharPt=
rCompare]
      WARN_ON(NULL =3D=3D "Invalid VMID mode");
                   ^

vim +/pos +47 kernel/locking/lockdep_proc.c

a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   46  =

a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  @47  static void *l_start(struct seq_file *m, loff_t *pos)
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   48  {
fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   49  	unsigned long idx =3D *pos;
fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   50  =

fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   51  	if (idx > max_lock_class_idx)
fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   52  		return NULL;
fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   53  	return lock_classes + idx;
94c61c0aeffe64 kernel/lockdep_proc.c         Tim Pepper          2007-10-11=
   54  }
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   55  =

a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   56  static void l_stop(struct seq_file *m, void *v)
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   57  {
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   58  }
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   59  =

068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   60  static void print_name(struct seq_file *m, struct lock_class *class)
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   61  {
99fb4a122e9620 kernel/lockdep_proc.c         Cyrill Gorcunov     2012-10-20=
   62  	char str[KSYM_NAME_LEN];
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   63  	const char *name =3D class->name;
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   64  =

068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   65  	if (!name) {
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   66  		name =3D __get_key_name(class->key, str);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   67  		seq_printf(m, "%s", name);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   68  	} else{
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   69  		seq_printf(m, "%s", name);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   70  		if (class->name_version > 1)
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   71  			seq_printf(m, "#%d", class->name_version);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   72  		if (class->subclass)
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   73  			seq_printf(m, "/%d", class->subclass);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   74  	}
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   75  }
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   76  =

a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   77  static int l_show(struct seq_file *m, void *v)
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   78  {
fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   79  	struct lock_class *class =3D v;
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
   80  	struct lock_list *entry;
f510b233cfc7bf kernel/lockdep_proc.c         Peter Zijlstra      2009-01-22=
   81  	char usage[LOCK_USAGE_CHARS];
fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   82  	int idx =3D class - lock_classes;
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   83  =

fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   84  	if (v =3D=3D lock_classes)
94c61c0aeffe64 kernel/lockdep_proc.c         Tim Pepper          2007-10-11=
   85  		seq_printf(m, "all lock classes:\n");
fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   86  =

fb7275acd6fb98 kernel/locking/lockdep_proc.c Waiman Long         2022-02-10=
   87  	if (!test_bit(idx, lock_classes_in_use))
94c61c0aeffe64 kernel/lockdep_proc.c         Tim Pepper          2007-10-11=
   88  		return 0;
94c61c0aeffe64 kernel/lockdep_proc.c         Tim Pepper          2007-10-11=
   89  =

a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   90  	seq_printf(m, "%p", class->key);
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   91  #ifdef CONFIG_DEBUG_LOCKDEP
8ca2b56cd7da98 kernel/locking/lockdep_proc.c Waiman Long         2018-10-03=
   92  	seq_printf(m, " OPS:%8ld", debug_class_ops_read(class));
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   93  #endif
4840ce2267f9d8 kernel/locking/lockdep_proc.c Xiongwei Song       2021-06-29=
   94  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
df60a844186615 kernel/lockdep_proc.c         Stephen Hemminger   2008-08-15=
   95  		seq_printf(m, " FD:%5ld", lockdep_count_forward_deps(class));
df60a844186615 kernel/lockdep_proc.c         Stephen Hemminger   2008-08-15=
   96  		seq_printf(m, " BD:%5ld", lockdep_count_backward_deps(class));
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
   97  =

f510b233cfc7bf kernel/lockdep_proc.c         Peter Zijlstra      2009-01-22=
   98  		get_usage_chars(class, usage);
f510b233cfc7bf kernel/lockdep_proc.c         Peter Zijlstra      2009-01-22=
   99  		seq_printf(m, " %s", usage);
4840ce2267f9d8 kernel/locking/lockdep_proc.c Xiongwei Song       2021-06-29=
  100  	}
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  101  =

068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  102  	seq_printf(m, ": ");
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  103  	print_name(m, class);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  104  	seq_puts(m, "\n");
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  105  =

4840ce2267f9d8 kernel/locking/lockdep_proc.c Xiongwei Song       2021-06-29=
  106  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  107  		list_for_each_entry(entry, &class->locks_after, entry) {
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  108  			if (entry->distance =3D=3D 1) {
2429e4ee78e2fa kernel/lockdep_proc.c         Huang, Ying         2008-06-13=
  109  				seq_printf(m, " -> [%p] ", entry->class->key);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  110  				print_name(m, entry->class);
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  111  				seq_puts(m, "\n");
068135e6351831 kernel/lockdep_proc.c         Jason Baron         2007-02-10=
  112  			}
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  113  		}
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  114  		seq_puts(m, "\n");
4840ce2267f9d8 kernel/locking/lockdep_proc.c Xiongwei Song       2021-06-29=
  115  	}
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  116  =

a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  117  	return 0;
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  118  }
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  119  =

15ad7cdcfd7645 kernel/lockdep_proc.c         Helge Deller        2006-12-06=
  120  static const struct seq_operations lockdep_ops =3D {
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  121  	.start	=3D l_start,
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  122  	.next	=3D l_next,
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  123  	.stop	=3D l_stop,
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  124  	.show	=3D l_show,
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  125  };
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  126  =

cd1a28e8457e6e kernel/lockdep_proc.c         Huang, Ying         2008-06-23=
  127  #ifdef CONFIG_PROVE_LOCKING
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  128  static void *lc_start(struct seq_file *m, loff_t *pos)
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  129  {
2212684adff79e kernel/locking/lockdep_proc.c Bart Van Assche     2019-02-14=
  130  	if (*pos < 0)
2212684adff79e kernel/locking/lockdep_proc.c Bart Van Assche     2019-02-14=
  131  		return NULL;
2212684adff79e kernel/locking/lockdep_proc.c Bart Van Assche     2019-02-14=
  132  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  133  	if (*pos =3D=3D 0)
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  134  		return SEQ_START_TOKEN;
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  135  =

e9d65725bdf595 kernel/lockdep_proc.c         Li Zefan            2009-08-17=
  136  	return lock_chains + (*pos - 1);
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  137  }
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  138  =

12aac19d4ba410 kernel/lockdep_proc.c         Li Zefan            2009-08-17=
  139  static void *lc_next(struct seq_file *m, void *v, loff_t *pos)
12aac19d4ba410 kernel/lockdep_proc.c         Li Zefan            2009-08-17=
  140  {
2212684adff79e kernel/locking/lockdep_proc.c Bart Van Assche     2019-02-14=
  141  	*pos =3D lockdep_next_lockchain(*pos - 1) + 1;
12aac19d4ba410 kernel/lockdep_proc.c         Li Zefan            2009-08-17=
  142  	return lc_start(m, pos);
12aac19d4ba410 kernel/lockdep_proc.c         Li Zefan            2009-08-17=
  143  }
12aac19d4ba410 kernel/lockdep_proc.c         Li Zefan            2009-08-17=
  144  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  145  static void lc_stop(struct seq_file *m, void *v)
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  146  {
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  147  }
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  148  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  149  static int lc_show(struct seq_file *m, void *v)
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  150  {
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  151  	struct lock_chain *chain =3D v;
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  152  	struct lock_class *class;
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  153  	int i;
b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  154  	static const char * const irq_strs[] =3D {
b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  155  		[0]			     =3D "0",
b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  156  		[LOCK_CHAIN_HARDIRQ_CONTEXT] =3D "hardirq",
b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  157  		[LOCK_CHAIN_SOFTIRQ_CONTEXT] =3D "softirq",
b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  158  		[LOCK_CHAIN_SOFTIRQ_CONTEXT|
b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  159  		 LOCK_CHAIN_HARDIRQ_CONTEXT] =3D "hardirq|softirq",
b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  160  	};
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  161  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  162  	if (v =3D=3D SEQ_START_TOKEN) {
810507fe6fd5ff kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  163  		if (!nr_free_chain_hlocks)
75dd602a5198a6 kernel/locking/lockdep_proc.c Peter Zijlstra      2016-03-30=
  164  			seq_printf(m, "(buggered) ");
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  165  		seq_printf(m, "all lock chains:\n");
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  166  		return 0;
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  167  	}
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  168  =

b9875e98822957 kernel/locking/lockdep_proc.c Waiman Long         2020-02-06=
  169  	seq_printf(m, "irq_context: %s\n", irq_strs[chain->irq_context]);
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  170  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  171  	for (i =3D 0; i < chain->depth; i++) {
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  172  		class =3D lock_chain_get_class(chain, i);
8bfe0298f7a049 kernel/lockdep_proc.c         Rabin Vincent       2008-08-11=
  173  		if (!class->key)
8bfe0298f7a049 kernel/lockdep_proc.c         Rabin Vincent       2008-08-11=
  174  			continue;
8bfe0298f7a049 kernel/lockdep_proc.c         Rabin Vincent       2008-08-11=
  175  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  176  		seq_printf(m, "[%p] ", class->key);
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  177  		print_name(m, class);
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  178  		seq_puts(m, "\n");
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  179  	}
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  180  	seq_puts(m, "\n");
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  181  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  182  	return 0;
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  183  }
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  184  =

443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  185  static const struct seq_operations lockdep_chains_ops =3D {
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  186  	.start	=3D lc_start,
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  187  	.next	=3D lc_next,
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  188  	.stop	=3D lc_stop,
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  189  	.show	=3D lc_show,
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  190  };
cd1a28e8457e6e kernel/lockdep_proc.c         Huang, Ying         2008-06-23=
  191  #endif /* CONFIG_PROVE_LOCKING */
443cd507ce7f78 kernel/lockdep_proc.c         Huang, Ying         2008-06-20=
  192  =

a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  193  static void lockdep_stats_debug_show(struct seq_file *m)
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  194  {
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  195  #ifdef CONFIG_DEBUG_LOCKDEP
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
 @196  	unsigned long long hi1 =3D debug_atomic_read(hardirqs_on_events),
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  197  			   hi2 =3D debug_atomic_read(hardirqs_off_events),
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  198  			   hr1 =3D debug_atomic_read(redundant_hardirqs_on),
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  199  			   hr2 =3D debug_atomic_read(redundant_hardirqs_off),
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  200  			   si1 =3D debug_atomic_read(softirqs_on_events),
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  201  			   si2 =3D debug_atomic_read(softirqs_off_events),
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  202  			   sr1 =3D debug_atomic_read(redundant_softirqs_on),
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  203  			   sr2 =3D debug_atomic_read(redundant_softirqs_off);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  204  =

bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  205  	seq_printf(m, " chain lookup misses:           %11llu\n",
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  206  		debug_atomic_read(chain_lookup_misses));
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  207  	seq_printf(m, " chain lookup hits:             %11llu\n",
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  208  		debug_atomic_read(chain_lookup_hits));
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  209  	seq_printf(m, " cyclic checks:                 %11llu\n",
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  210  		debug_atomic_read(nr_cyclic_checks));
ae813308f46306 kernel/locking/lockdep_proc.c Peter Zijlstra      2017-03-03=
  211  	seq_printf(m, " redundant checks:              %11llu\n",
ae813308f46306 kernel/locking/lockdep_proc.c Peter Zijlstra      2017-03-03=
  212  		debug_atomic_read(nr_redundant_checks));
ae813308f46306 kernel/locking/lockdep_proc.c Peter Zijlstra      2017-03-03=
  213  	seq_printf(m, " redundant links:               %11llu\n",
ae813308f46306 kernel/locking/lockdep_proc.c Peter Zijlstra      2017-03-03=
  214  		debug_atomic_read(nr_redundant));
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  215  	seq_printf(m, " find-mask forwards checks:     %11llu\n",
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  216  		debug_atomic_read(nr_find_usage_forwards_checks));
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  217  	seq_printf(m, " find-mask backwards checks:    %11llu\n",
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  218  		debug_atomic_read(nr_find_usage_backwards_checks));
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  219  =

bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  220  	seq_printf(m, " hardirq on events:             %11llu\n", hi1);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  221  	seq_printf(m, " hardirq off events:            %11llu\n", hi2);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  222  	seq_printf(m, " redundant hardirq ons:         %11llu\n", hr1);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  223  	seq_printf(m, " redundant hardirq offs:        %11llu\n", hr2);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  224  	seq_printf(m, " softirq on events:             %11llu\n", si1);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  225  	seq_printf(m, " softirq off events:            %11llu\n", si2);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  226  	seq_printf(m, " redundant softirq ons:         %11llu\n", sr1);
bd6d29c25bb1a2 kernel/lockdep_proc.c         Frederic Weisbecker 2010-04-06=
  227  	seq_printf(m, " redundant softirq offs:        %11llu\n", sr2);
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  228  #endif
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  229  }
a8f24a3978c5f8 kernel/lockdep_proc.c         Ingo Molnar         2006-07-03=
  230  =


:::::: The code at line 47 was first introduced by commit
:::::: a8f24a3978c5f82419e1c90dc90460731204f46f [PATCH] lockdep: procfs

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4601313637347857966==--

