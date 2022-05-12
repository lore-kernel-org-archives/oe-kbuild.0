Content-Type: multipart/mixed; boundary="===============5319525926876537572=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] fs/proc: add mask_secrets to prevent sensitive information leakage.
Date: Thu, 12 May 2022 21:25:39 +0800
Message-ID: <202205122111.t1UqbBY0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5319525926876537572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220509054613.6620-1-zhang.lin16@zte.com.cn>
References: <20220509054613.6620-1-zhang.lin16@zte.com.cn>
TO: zhanglin <zhang.lin16@zte.com.cn>
TO: linux-kernel(a)vger.kernel.org
CC: linux-fsdevel(a)vger.kernel.org
CC: brauner(a)kernel.org
CC: akpm(a)linux-foundation.org
CC: keescook(a)chromium.org
CC: adobriyan(a)gmail.com
CC: sfr(a)canb.auug.org.au
CC: zhengqi.arch(a)bytedance.com
CC: ebiederm(a)xmission.com
CC: kaleshsingh(a)google.com
CC: stephen.s.brennan(a)oracle.com
CC: ohoono.kwon(a)samsung.com
CC: haolee.swjtu(a)gmail.com
CC: fweimer(a)redhat.com
CC: xue.zhihong(a)zte.com.cn
CC: wang.yi59(a)zte.com.cn
CC: jiang.xuexin(a)zte.com.cn
CC: zealci(a)zte.com.cn
CC: zhanglin <zhang.lin16@zte.com.cn>

Hi zhanglin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on akpm-mm/mm-everything linus/master v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/zhanglin/fs-proc-add=
-mask_secrets-to-prevent-sensitive-information-leakage/20220509-140823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: h8300-randconfig-s031-20220512 (https://download.01.org/0day-ci/arc=
hive/20220512/202205122111.t1UqbBY0-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f8d1c429178d1ee0c44=
7ee68f4e7b602c5df911f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhanglin/fs-proc-add-mask_secrets-=
to-prevent-sensitive-information-leakage/20220509-140823
        git checkout f8d1c429178d1ee0c447ee68f4e7b602c5df911f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dh=
8300 SHELL=3D/bin/bash fs/proc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:417:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:469:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:26:57: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected int [noderef] __rcu *static =
[toplevel] mask_secrets_enabled @@     got int * @@
   fs/proc/mask_secrets.c:26:57: sparse:     expected int [noderef] __rcu *=
static [toplevel] mask_secrets_enabled
   fs/proc/mask_secrets.c:26:57: sparse:     got int *
>> fs/proc/mask_secrets.c:56:29: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:57:31: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:58:22: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:59:26: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:62:32: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:63:30: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:64:44: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:65:25: sparse: sparse: Using plain integer as NUL=
L pointer
   fs/proc/mask_secrets.c:67:23: sparse: sparse: Using plain integer as NUL=
L pointer
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
>> fs/proc/mask_secrets.c:112:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:271:44: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:282:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:305:44: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:308:24: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:314:9: sparse: sparse: cast removes address space=
 '__rcu' of expression
   fs/proc/mask_secrets.c:339:32: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:343:47: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:359:44: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:360:26: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:361:31: sparse: sparse: Using plain integer as NU=
LL pointer
   fs/proc/mask_secrets.c:362:24: sparse: sparse: too many warnings

vim +/__rcu +112 fs/proc/mask_secrets.c

f8d1c429178d1e zhanglin 2022-05-09   21  =

f8d1c429178d1e zhanglin 2022-05-09   22  static const char *SECRET_SEPARATO=
R =3D ":";
f8d1c429178d1e zhanglin 2022-05-09   23  static const int MASK_SECRETS_ENAB=
LED =3D 1;
f8d1c429178d1e zhanglin 2022-05-09   24  static const int MASK_SECRETS_DISA=
BLED;
f8d1c429178d1e zhanglin 2022-05-09   25  static DEFINE_SPINLOCK(mask_secret=
s_enabled_spinlock);
f8d1c429178d1e zhanglin 2022-05-09  @26  static int __rcu *mask_secrets_ena=
bled __read_mostly =3D (int *)&MASK_SECRETS_DISABLED;
f8d1c429178d1e zhanglin 2022-05-09   27  static DEFINE_SPINLOCK(cmdline_has=
htab_spinlock);
f8d1c429178d1e zhanglin 2022-05-09   28  static struct hlist_head __rcu cmd=
line_hashtab[CMDLINE_HASHTABSIZE] __read_mostly =3D {
f8d1c429178d1e zhanglin 2022-05-09   29  	[0 ... (CMDLINE_HASHTABSIZE-1)] =
=3D HLIST_HEAD_INIT };
f8d1c429178d1e zhanglin 2022-05-09   30  static struct kmem_cache *cmdline_=
hashtab_item_cachep;
f8d1c429178d1e zhanglin 2022-05-09   31  =

f8d1c429178d1e zhanglin 2022-05-09   32  struct cmdline_hashtab_item {
f8d1c429178d1e zhanglin 2022-05-09   33  	struct hlist_node hlist;
f8d1c429178d1e zhanglin 2022-05-09   34  	char *cmdline;
f8d1c429178d1e zhanglin 2022-05-09   35  	char *progname;
f8d1c429178d1e zhanglin 2022-05-09   36  	char *secrets;
f8d1c429178d1e zhanglin 2022-05-09   37  };
f8d1c429178d1e zhanglin 2022-05-09   38  =

f8d1c429178d1e zhanglin 2022-05-09   39  static int is_mask_secrets_enabled=
(void)
f8d1c429178d1e zhanglin 2022-05-09   40  {
f8d1c429178d1e zhanglin 2022-05-09   41  	int ret =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   42  =

f8d1c429178d1e zhanglin 2022-05-09   43  	rcu_read_lock();
f8d1c429178d1e zhanglin 2022-05-09   44  	ret =3D *(rcu_dereference(mask_se=
crets_enabled));
f8d1c429178d1e zhanglin 2022-05-09   45  	rcu_read_unlock();
f8d1c429178d1e zhanglin 2022-05-09   46  	return ret;
f8d1c429178d1e zhanglin 2022-05-09   47  }
f8d1c429178d1e zhanglin 2022-05-09   48  =

f8d1c429178d1e zhanglin 2022-05-09   49  size_t mask_secrets(struct mm_stru=
ct *mm, char __user *buf,
f8d1c429178d1e zhanglin 2022-05-09   50  			      size_t count, loff_t pos)
f8d1c429178d1e zhanglin 2022-05-09   51  {
f8d1c429178d1e zhanglin 2022-05-09   52  	unsigned long arg_start =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   53  	unsigned long arg_end =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   54  	int mask_arg_len =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   55  	size_t remote_vm_copied =3D 0;
f8d1c429178d1e zhanglin 2022-05-09  @56  	struct file *file =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   57  	struct inode *inode =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   58  	char *kbuf =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   59  	char *progname =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   60  	int proghash =3D -1;
f8d1c429178d1e zhanglin 2022-05-09   61  	int prog_found =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   62  	char *mask_arg_start =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   63  	char *mask_arg_end =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   64  	struct cmdline_hashtab_item *chi =
=3D 0;
f8d1c429178d1e zhanglin 2022-05-09   65  	char *psecret =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   66  	size_t psecret_len =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   67  	char *pmask =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   68  	size_t pmask_len =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   69  	size_t size;
f8d1c429178d1e zhanglin 2022-05-09   70  	size_t total_copied =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   71  	int err =3D 0;
f8d1c429178d1e zhanglin 2022-05-09   72  =

f8d1c429178d1e zhanglin 2022-05-09   73  	if (!is_mask_secrets_enabled()) {
f8d1c429178d1e zhanglin 2022-05-09   74  		err =3D -EPERM;
f8d1c429178d1e zhanglin 2022-05-09   75  		goto exit_err;
f8d1c429178d1e zhanglin 2022-05-09   76  	}
f8d1c429178d1e zhanglin 2022-05-09   77  =

f8d1c429178d1e zhanglin 2022-05-09   78  	spin_lock(&mm->arg_lock);
f8d1c429178d1e zhanglin 2022-05-09   79  	arg_start =3D mm->arg_start;
f8d1c429178d1e zhanglin 2022-05-09   80  	arg_end =3D mm->arg_end;
f8d1c429178d1e zhanglin 2022-05-09   81  	spin_unlock(&mm->arg_lock);
f8d1c429178d1e zhanglin 2022-05-09   82  	if (arg_start >=3D arg_end) {
f8d1c429178d1e zhanglin 2022-05-09   83  		err =3D -ERANGE;
f8d1c429178d1e zhanglin 2022-05-09   84  		goto exit_err;
f8d1c429178d1e zhanglin 2022-05-09   85  	}
f8d1c429178d1e zhanglin 2022-05-09   86  	mask_arg_len =3D arg_end - arg_st=
art + 1;
f8d1c429178d1e zhanglin 2022-05-09   87  =

f8d1c429178d1e zhanglin 2022-05-09   88  	file =3D get_mm_exe_file(mm);
f8d1c429178d1e zhanglin 2022-05-09   89  	if (!file) {
f8d1c429178d1e zhanglin 2022-05-09   90  		err =3D -ENOENT;
f8d1c429178d1e zhanglin 2022-05-09   91  		goto exit_err;
f8d1c429178d1e zhanglin 2022-05-09   92  	}
f8d1c429178d1e zhanglin 2022-05-09   93  	inode =3D file_inode(file);
f8d1c429178d1e zhanglin 2022-05-09   94  	if (!inode) {
f8d1c429178d1e zhanglin 2022-05-09   95  		err =3D -ENOENT;
f8d1c429178d1e zhanglin 2022-05-09   96  		goto exit_err;
f8d1c429178d1e zhanglin 2022-05-09   97  	}
f8d1c429178d1e zhanglin 2022-05-09   98  	proghash =3D cmdline_hash(inode->=
i_ino);
f8d1c429178d1e zhanglin 2022-05-09   99  	kbuf =3D kzalloc(max(PATH_MAX, ma=
sk_arg_len), GFP_KERNEL);
f8d1c429178d1e zhanglin 2022-05-09  100  	if (!kbuf) {
f8d1c429178d1e zhanglin 2022-05-09  101  		err =3D -ENOMEM;
f8d1c429178d1e zhanglin 2022-05-09  102  		goto exit_err;
f8d1c429178d1e zhanglin 2022-05-09  103  	}
f8d1c429178d1e zhanglin 2022-05-09  104  	progname =3D d_path(&file->f_path=
, kbuf, PATH_MAX);
f8d1c429178d1e zhanglin 2022-05-09  105  	if (IS_ERR_OR_NULL(progname)) {
f8d1c429178d1e zhanglin 2022-05-09  106  		err =3D -ENOENT;
f8d1c429178d1e zhanglin 2022-05-09  107  		goto cleanup_kbuf;
f8d1c429178d1e zhanglin 2022-05-09  108  	}
f8d1c429178d1e zhanglin 2022-05-09  109  =

f8d1c429178d1e zhanglin 2022-05-09  110  	rcu_read_lock();
f8d1c429178d1e zhanglin 2022-05-09  111  	prog_found =3D 0;
f8d1c429178d1e zhanglin 2022-05-09 @112  	hash_for_each_possible_rcu(cmdlin=
e_hashtab, chi, hlist, proghash)
f8d1c429178d1e zhanglin 2022-05-09  113  		if (strcmp(chi->progname, progna=
me) =3D=3D 0) {
f8d1c429178d1e zhanglin 2022-05-09  114  			prog_found =3D 1;
f8d1c429178d1e zhanglin 2022-05-09  115  			break;
f8d1c429178d1e zhanglin 2022-05-09  116  		}
f8d1c429178d1e zhanglin 2022-05-09  117  =

f8d1c429178d1e zhanglin 2022-05-09  118  	if (!prog_found) {
f8d1c429178d1e zhanglin 2022-05-09  119  		rcu_read_unlock();
f8d1c429178d1e zhanglin 2022-05-09  120  		goto cleanup_kbuf;
f8d1c429178d1e zhanglin 2022-05-09  121  	}
f8d1c429178d1e zhanglin 2022-05-09  122  =

f8d1c429178d1e zhanglin 2022-05-09  123  	mask_arg_start =3D kbuf;
f8d1c429178d1e zhanglin 2022-05-09  124  	mask_arg_end =3D mask_arg_start +=
 (arg_end - arg_start);
f8d1c429178d1e zhanglin 2022-05-09  125  	remote_vm_copied =3D access_remot=
e_vm(mm, arg_start, mask_arg_start, mask_arg_len, FOLL_ANON);
f8d1c429178d1e zhanglin 2022-05-09  126  	if (remote_vm_copied <=3D 0) {
f8d1c429178d1e zhanglin 2022-05-09  127  		rcu_read_unlock();
f8d1c429178d1e zhanglin 2022-05-09  128  		err =3D -EIO;
f8d1c429178d1e zhanglin 2022-05-09  129  		goto cleanup_kbuf;
f8d1c429178d1e zhanglin 2022-05-09  130  	}
f8d1c429178d1e zhanglin 2022-05-09  131  	/*skip progname */
f8d1c429178d1e zhanglin 2022-05-09  132  	for (pmask =3D mask_arg_start; *p=
mask && (pmask <=3D mask_arg_end); pmask++)
f8d1c429178d1e zhanglin 2022-05-09  133  		;
f8d1c429178d1e zhanglin 2022-05-09  134  =

f8d1c429178d1e zhanglin 2022-05-09  135  	if (!chi->secrets) {
f8d1c429178d1e zhanglin 2022-05-09  136  		rcu_read_unlock();
f8d1c429178d1e zhanglin 2022-05-09  137  		/*mask everything, such as: xxxc=
onnect host port username password.*/
f8d1c429178d1e zhanglin 2022-05-09  138  		for (pmask =3D pmask + 1; (pmask=
 <=3D mask_arg_end); pmask++)
f8d1c429178d1e zhanglin 2022-05-09  139  			for (; (pmask <=3D mask_arg_end=
) && (*pmask); pmask++)
f8d1c429178d1e zhanglin 2022-05-09  140  				*pmask =3D 'Z';
f8d1c429178d1e zhanglin 2022-05-09  141  		goto copydata;
f8d1c429178d1e zhanglin 2022-05-09  142  	}
f8d1c429178d1e zhanglin 2022-05-09  143  =

f8d1c429178d1e zhanglin 2022-05-09  144  	for (pmask =3D pmask + 1; pmask <=
=3D mask_arg_end; pmask++) {
f8d1c429178d1e zhanglin 2022-05-09  145  		psecret =3D chi->secrets;
f8d1c429178d1e zhanglin 2022-05-09  146  		while (*psecret) {
f8d1c429178d1e zhanglin 2022-05-09  147  			psecret_len =3D strlen(psecret);
f8d1c429178d1e zhanglin 2022-05-09  148  			if (psecret_len < 2) {
f8d1c429178d1e zhanglin 2022-05-09  149  				rcu_read_unlock();
f8d1c429178d1e zhanglin 2022-05-09  150  				err =3D -EINVAL;
f8d1c429178d1e zhanglin 2022-05-09  151  				goto cleanup_kbuf;
f8d1c429178d1e zhanglin 2022-05-09  152  			}
f8d1c429178d1e zhanglin 2022-05-09  153  =

f8d1c429178d1e zhanglin 2022-05-09  154  			if (strcmp(pmask, psecret) =3D=
=3D 0) {
f8d1c429178d1e zhanglin 2022-05-09  155  				pmask +=3D psecret_len + 1;
f8d1c429178d1e zhanglin 2022-05-09  156  				goto mask_secret;
f8d1c429178d1e zhanglin 2022-05-09  157  			}
f8d1c429178d1e zhanglin 2022-05-09  158  =

f8d1c429178d1e zhanglin 2022-05-09  159  			if (strncmp(pmask, psecret, pse=
cret_len) =3D=3D 0) {
f8d1c429178d1e zhanglin 2022-05-09  160  				/*handle case: --password=3Dxx=
xx */
f8d1c429178d1e zhanglin 2022-05-09  161  				if ((psecret[0] =3D=3D '-') &&=
 (psecret[1] =3D=3D '-'))
f8d1c429178d1e zhanglin 2022-05-09  162  					if (pmask[psecret_len] =3D=3D=
 '=3D') {
f8d1c429178d1e zhanglin 2022-05-09  163  						pmask +=3D psecret_len + 1;
f8d1c429178d1e zhanglin 2022-05-09  164  						goto mask_secret;
f8d1c429178d1e zhanglin 2022-05-09  165  					}
f8d1c429178d1e zhanglin 2022-05-09  166  =

f8d1c429178d1e zhanglin 2022-05-09  167  				if (psecret[0] =3D=3D '-') {
f8d1c429178d1e zhanglin 2022-05-09  168  					/*handle case: -password=3Dxx=
xx or -p=3Dxxxx*/
f8d1c429178d1e zhanglin 2022-05-09  169  					if (pmask[psecret_len] =3D=3D=
 '=3D') {
f8d1c429178d1e zhanglin 2022-05-09  170  						pmask +=3D psecret_len + 1;
f8d1c429178d1e zhanglin 2022-05-09  171  						goto mask_secret;
f8d1c429178d1e zhanglin 2022-05-09  172  					}
f8d1c429178d1e zhanglin 2022-05-09  173  =

f8d1c429178d1e zhanglin 2022-05-09  174  					/*handle case: -pxxxx*/
f8d1c429178d1e zhanglin 2022-05-09  175  					if (psecret_len =3D=3D 2) {
f8d1c429178d1e zhanglin 2022-05-09  176  						pmask +=3D psecret_len;
f8d1c429178d1e zhanglin 2022-05-09  177  						goto mask_secret;
f8d1c429178d1e zhanglin 2022-05-09  178  					}
f8d1c429178d1e zhanglin 2022-05-09  179  				}
f8d1c429178d1e zhanglin 2022-05-09  180  			}
f8d1c429178d1e zhanglin 2022-05-09  181  =

f8d1c429178d1e zhanglin 2022-05-09  182  			if (psecret_len =3D=3D 2) {
f8d1c429178d1e zhanglin 2022-05-09  183  				pmask_len =3D strlen(pmask);
f8d1c429178d1e zhanglin 2022-05-09  184  				/*handle case: -yp xxxx, such =
as: useradd -rp xxxx*/
f8d1c429178d1e zhanglin 2022-05-09  185  				if ((pmask_len > 2) && (*pmask=
 =3D=3D '-')
f8d1c429178d1e zhanglin 2022-05-09  186  				      && (pmask[pmask_len - 1]=
 =3D=3D psecret[1])) {
f8d1c429178d1e zhanglin 2022-05-09  187  					pmask +=3D pmask_len + 1;
f8d1c429178d1e zhanglin 2022-05-09  188  					goto mask_secret;
f8d1c429178d1e zhanglin 2022-05-09  189  				}
f8d1c429178d1e zhanglin 2022-05-09  190  			}
f8d1c429178d1e zhanglin 2022-05-09  191  =

f8d1c429178d1e zhanglin 2022-05-09  192  			psecret +=3D psecret_len + 1;
f8d1c429178d1e zhanglin 2022-05-09  193  		}
f8d1c429178d1e zhanglin 2022-05-09  194  =

f8d1c429178d1e zhanglin 2022-05-09  195  		pmask +=3D strlen(pmask);
f8d1c429178d1e zhanglin 2022-05-09  196  		continue;
f8d1c429178d1e zhanglin 2022-05-09  197  =

f8d1c429178d1e zhanglin 2022-05-09  198  mask_secret:
f8d1c429178d1e zhanglin 2022-05-09  199  		for (; (pmask <=3D mask_arg_end)=
 && (*pmask); pmask++)
f8d1c429178d1e zhanglin 2022-05-09  200  			*pmask =3D 'Z';
f8d1c429178d1e zhanglin 2022-05-09  201  	}
f8d1c429178d1e zhanglin 2022-05-09  202  	rcu_read_unlock();
f8d1c429178d1e zhanglin 2022-05-09  203  =

f8d1c429178d1e zhanglin 2022-05-09  204  copydata:
f8d1c429178d1e zhanglin 2022-05-09  205  	size =3D arg_end - pos;
f8d1c429178d1e zhanglin 2022-05-09  206  	size =3D min_t(size_t, size, coun=
t);
f8d1c429178d1e zhanglin 2022-05-09  207  	if (copy_to_user(buf, mask_arg_st=
art + pos - arg_start, size))
f8d1c429178d1e zhanglin 2022-05-09  208  		goto cleanup_kbuf;
f8d1c429178d1e zhanglin 2022-05-09  209  =

f8d1c429178d1e zhanglin 2022-05-09  210  	total_copied =3D size;
f8d1c429178d1e zhanglin 2022-05-09  211  =

f8d1c429178d1e zhanglin 2022-05-09  212  cleanup_kbuf:
f8d1c429178d1e zhanglin 2022-05-09  213  	kfree(kbuf);
f8d1c429178d1e zhanglin 2022-05-09  214  =

f8d1c429178d1e zhanglin 2022-05-09  215  exit_err:
f8d1c429178d1e zhanglin 2022-05-09  216  	return total_copied;
f8d1c429178d1e zhanglin 2022-05-09  217  }
f8d1c429178d1e zhanglin 2022-05-09  218  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5319525926876537572==--

