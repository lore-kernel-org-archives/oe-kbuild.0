Content-Type: multipart/mixed; boundary="===============8419660036764630941=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] cifs: Fix leak when handling lease break for cached root fid
Date: Tue, 30 Jun 2020 15:34:05 +0800
Message-ID: <202006301556.mlKVWAhA%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8419660036764630941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200630023003.1858066-1-paul@darkrain42.org>
References: <20200630023003.1858066-1-paul@darkrain42.org>
TO: Paul Aurich <paul@darkrain42.org>

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on v5.8-rc3 next-20200629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Paul-Aurich/cifs-Fix-leak-=
when-handling-lease-break-for-cached-root-fid/20200630-103420
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: sparc-randconfig-s031-20200630 (attached as .config)
compiler: sparc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-3-gfa153962-dirty
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsparc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

         |     ^~~~~~~~~~~~~~~
   fs/cifs/ioctl.c: In function 'cifs_ioctl':
   fs/cifs/ioctl.c:174:10: warning: variable 'caps' set but not used [-Wunu=
sed-but-set-variable]
     174 |  __u64   caps;
         |          ^~~~
   In file included from fs/btrfs/zstd.c:19:
   include/linux/zstd.h:798:21: warning: 'ZSTD_skippableHeaderSize' defined=
 but not used [-Wunused-const-variable=3D]
     798 | static const size_t ZSTD_skippableHeaderSize =3D 8;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/zstd.h:796:21: warning: 'ZSTD_frameHeaderSize_max' defined=
 but not used [-Wunused-const-variable=3D]
     796 | static const size_t ZSTD_frameHeaderSize_max =3D ZSTD_FRAMEHEADE=
RSIZE_MAX;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/zstd.h:795:21: warning: 'ZSTD_frameHeaderSize_min' defined=
 but not used [-Wunused-const-variable=3D]
     795 | static const size_t ZSTD_frameHeaderSize_min =3D ZSTD_FRAMEHEADE=
RSIZE_MIN;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/zstd.h:794:21: warning: 'ZSTD_frameHeaderSize_prefix' defi=
ned but not used [-Wunused-const-variable=3D]
     794 | static const size_t ZSTD_frameHeaderSize_prefix =3D 5;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noder=
ef] __rcu *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [nodere=
f] __rcu *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [nodere=
f] __rcu *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
   In file included from fs/btrfs/compression.c:22:
   fs/btrfs/ctree.h:2217:8: warning: type qualifiers ignored on function re=
turn type [-Wignored-qualifiers]
    2217 | size_t __const btrfs_get_num_csums(void);
         |        ^~~~~~~
   fs/signalfd.c:66:33: sparse: sparse: incorrect type in argument 2 (diffe=
rent address spaces) @@     expected struct wait_queue_head [usertype] *wai=
t_address @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:66:33: sparse:     expected struct wait_queue_head [userty=
pe] *wait_address
   fs/signalfd.c:66:33: sparse:     got struct wait_queue_head [noderef] __=
rcu *
   fs/signalfd.c:68:31: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected struct spinlock [usertype] *lock @@   =
  got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:68:31: sparse:     expected struct spinlock [usertype] *lo=
ck
   fs/signalfd.c:68:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:73:33: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected struct spinlock [usertype] *lock @@   =
  got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:73:33: sparse:     expected struct spinlock [usertype] *lo=
ck
   fs/signalfd.c:73:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:108:32: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:125:33: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:131:33: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:150:32: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:154:38: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:172:31: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:172:31: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:172:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:181:41: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:181:41: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:181:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:185:32: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct wait_queue_head *wq_head @@   =
  got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:185:32: sparse:     expected struct wait_queue_head *wq_he=
ad
   fs/signalfd.c:185:32: sparse:     got struct wait_queue_head [noderef] _=
_rcu *
   fs/signalfd.c:195:41: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:195:41: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:195:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:197:39: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:197:39: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:197:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:199:33: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:199:33: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:199:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:201:35: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct wait_queue_head *wq_head @@   =
  got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:201:35: sparse:     expected struct wait_queue_head *wq_he=
ad
   fs/signalfd.c:201:35: sparse:     got struct wait_queue_head [noderef] _=
_rcu *
   fs/signalfd.c:301:39: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:301:39: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:301:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:303:41: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:303:41: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:303:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:305:17: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct wait_queue_head *wq_head @@   =
  got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:305:17: sparse:     expected struct wait_queue_head *wq_he=
ad
   fs/signalfd.c:305:17: sparse:     got struct wait_queue_head [noderef] _=
_rcu *
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'tree' n=
ot described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'offset'=
 not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'next_re=
t' not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'prev_re=
t' not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'p_ret' =
not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'parent_=
ret' not described in '__etree_search'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'tree' =
not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'start'=
 not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'start_=
ret' not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'end_re=
t' not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'bits' =
not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'tree' =
not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'start'=
 not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'start_=
ret' not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'end_re=
t' not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'bits' =
not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:4152: warning: Function parameter or member 'epd' n=
ot described in 'extent_write_cache_pages'
   fs/btrfs/extent_io.c:4152: warning: Excess function parameter 'data' des=
cription in 'extent_write_cache_pages'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'root' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'inode' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'ctl' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'block_group' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'io_ctl' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'trans' not described in '__btrfs_write_out_cache'
   fs/cifs/smb2misc.c:630:47: sparse: sparse: undefined identifier 'lw'
>> fs/cifs/smb2misc.c:542:24: sparse: sparse: context imbalance in 'smb2_tc=
on_has_lease' - unexpected unlock
>> fs/cifs/smb2misc.c:594:1: sparse: sparse: context imbalance in 'smb2_is_=
valid_lease_break' - wrong count at exit
   fs/cifs/smb2misc.c: In function 'smb2_is_valid_lease_break':
   fs/cifs/smb2misc.c:630:12: error: 'lw' undeclared (first use in this fun=
ction)
     630 |      kfree(lw);
         |            ^~
   fs/cifs/smb2misc.c:630:12: note: each undeclared identifier is reported =
only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:281: fs/cifs/smb2misc.o] Error 1
   fs/gfs2/inode.c:297: warning: Function parameter or member 'dir' not des=
cribed in 'gfs2_lookupi'
   fs/gfs2/inode.c:297: warning: Excess function parameter 'd_gh' descripti=
on in 'gfs2_lookupi'
   fs/gfs2/inode.c:297: warning: Excess function parameter 'i_gh' descripti=
on in 'gfs2_lookupi'
   fs/gfs2/inode.c:478: warning: Excess function parameter 'bhp' descriptio=
n in 'init_dinode'
   fs/gfs2/inode.c:599: warning: Function parameter or member 'excl' not de=
scribed in 'gfs2_create_inode'
   fs/gfs2/inode.c:845: warning: Function parameter or member 'excl' not de=
scribed in 'gfs2_create'
   fs/gfs2/inode.c:1089: warning: Function parameter or member 'dentry' not=
 described in 'gfs2_unlink_inode'
   fs/gfs2/inode.c:1089: warning: Excess function parameter 'name' descript=
ion in 'gfs2_unlink_inode'
   fs/gfs2/inode.c:1089: warning: Excess function parameter 'inode' descrip=
tion in 'gfs2_unlink_inode'
   fs/gfs2/inode.c:1834: warning: Excess function parameter 'flags' descrip=
tion in 'gfs2_permission'
   fs/gfs2/inode.c:1875: warning: Function parameter or member 'inode' not =
described in 'gfs2_setattr_simple'
   In file included from fs/btrfs/delayed-ref.c:9:
   fs/btrfs/ctree.h:2217:8: warning: type qualifiers ignored on function re=
turn type [-Wignored-qualifiers]
    2217 | size_t __const btrfs_get_num_csums(void);
         |        ^~~~~~~
   fs/gfs2/recovery.c:165: warning: Function parameter or member 'head' not=
 described in 'get_log_header'
   fs/gfs2/recovery.c:165: warning: Excess function parameter 'lh' descript=
ion in 'get_log_header'
   fs/gfs2/recovery.c:195: warning: Function parameter or member 'pass' not=
 described in 'foreach_descriptor'
   fs/btrfs/delayed-ref.c:80: warning: Function parameter or member 'fs_inf=
o' not described in 'btrfs_delayed_refs_rsv_release'
   fs/btrfs/delayed-ref.c:80: warning: Function parameter or member 'nr' no=
t described in 'btrfs_delayed_refs_rsv_release'
   fs/btrfs/delayed-ref.c:128: warning: Function parameter or member 'fs_in=
fo' not described in 'btrfs_migrate_to_delayed_refs_rsv'
   fs/btrfs/delayed-ref.c:128: warning: Function parameter or member 'src' =
not described in 'btrfs_migrate_to_delayed_refs_rsv'
   fs/btrfs/delayed-ref.c:128: warning: Function parameter or member 'num_b=
ytes' not described in 'btrfs_migrate_to_delayed_refs_rsv'
   fs/btrfs/delayed-ref.c:174: warning: Function parameter or member 'fs_in=
fo' not described in 'btrfs_delayed_refs_rsv_refill'
   fs/btrfs/delayed-ref.c:174: warning: Function parameter or member 'flush=
' not described in 'btrfs_delayed_refs_rsv_refill'
   fs/eventpoll.c:1131: warning: Function parameter or member 'new' not des=
cribed in 'list_add_tail_lockless'
   fs/eventpoll.c:1131: warning: Function parameter or member 'head' not de=
scribed in 'list_add_tail_lockless'
   fs/eventpoll.c:1171: warning: Function parameter or member 'epi' not des=
cribed in 'chain_epi_lockless'
   fs/btrfs/inode.c:2953: warning: Function parameter or member 'fs_info' n=
ot described in 'btrfs_wait_on_delayed_iputs'
   In file included from fs/btrfs/relocation.c:13:
   fs/btrfs/ctree.h:2217:8: warning: type qualifiers ignored on function re=
turn type [-Wignored-qualifiers]
    2217 | size_t __const btrfs_get_num_csums(void);
         |        ^~~~~~~
   fs/xfs/xfs_extent_busy.c:572:33: sparse: sparse: context imbalance in 'x=
fs_extent_busy_clear' - unexpected unlock
   fs/io_uring.c:2350:24: sparse: sparse: incorrect type in return expressi=
on (different address spaces) @@     expected void [noderef] __user * @@   =
  got struct io_buffer *[assigned] kbuf @@
   fs/io_uring.c:2350:24: sparse:     expected void [noderef] __user *
   fs/io_uring.c:2350:24: sparse:     got struct io_buffer *[assigned] kbuf
   fs/io_uring.c:2518:40: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected void [noderef] __user *[assigned] io=
v_base @@     got void * @@
   fs/io_uring.c:2518:40: sparse:     expected void [noderef] __user *[assi=
gned] iov_base
   fs/io_uring.c:2518:40: sparse:     got void *
   fs/io_uring.c:2901:37: sparse: sparse: incorrect type in argument 2 (dif=
ferent address spaces) @@     expected long long [noderef] [usertype] __use=
r *off_in @@     got long long [usertype] *[assigned] poff_in @@
   fs/io_uring.c:2901:37: sparse:     expected long long [noderef] [usertyp=
e] __user *off_in
   fs/io_uring.c:2901:37: sparse:     got long long [usertype] *[assigned] =
poff_in
   fs/io_uring.c:2901:51: sparse: sparse: incorrect type in argument 4 (dif=
ferent address spaces) @@     expected long long [noderef] [usertype] __use=
r *off_out @@     got long long [usertype] *[assigned] poff_out @@
   fs/io_uring.c:2901:51: sparse:     expected long long [noderef] [usertyp=
e] __user *off_out
   fs/io_uring.c:2901:51: sparse:     got long long [usertype] *[assigned] =
poff_out
   fs/io_uring.c:4085:72: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[usertype] mask @@
   fs/io_uring.c:4085:72: sparse:     expected int mask
   fs/io_uring.c:4085:72: sparse:     got restricted __poll_t [usertype] ma=
sk
   fs/io_uring.c:4090:21: sparse: sparse: incorrect type in assignment (dif=
ferent base types) @@     expected unsigned int [usertype] result @@     go=
t restricted __poll_t [usertype] mask @@
   fs/io_uring.c:4090:21: sparse:     expected unsigned int [usertype] resu=
lt
   fs/io_uring.c:4090:21: sparse:     got restricted __poll_t [usertype] ma=
sk
   fs/io_uring.c:4116:29: sparse: sparse: incorrect type in assignment (dif=
ferent base types) @@     expected unsigned int [usertype] result @@     go=
t restricted __poll_t @@
   fs/io_uring.c:4116:29: sparse:     expected unsigned int [usertype] resu=
lt
   fs/io_uring.c:4116:29: sparse:     got restricted __poll_t
   fs/io_uring.c:4166:34: sparse: sparse: incorrect type in argument 2 (dif=
ferent base types) @@     expected restricted __poll_t [usertype] mask @@  =
   got unsigned int [usertype] result @@
   fs/io_uring.c:4166:34: sparse:     expected restricted __poll_t [usertyp=
e] mask
   fs/io_uring.c:4166:34: sparse:     got unsigned int [usertype] result
   fs/io_uring.c:4344:41: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[usertype] @@
   fs/io_uring.c:4344:41: sparse:     expected int mask
   fs/io_uring.c:4344:41: sparse:     got restricted __poll_t [usertype]
   fs/io_uring.c:4429:22: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:4429:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4429:22: sparse:    right side has type int
   fs/io_uring.c:4431:22: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:4431:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4431:22: sparse:    right side has type int
   fs/io_uring.c:4432:14: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:4432:14: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4432:14: sparse:    right side has type int
   fs/io_uring.c:4450:67: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[assigned] [usertype] mask @@
   fs/io_uring.c:4450:67: sparse:     expected int mask
   fs/io_uring.c:4450:67: sparse:     got restricted __poll_t [assigned] [u=
sertype] mask
   fs/io_uring.c:4451:52: sparse: sparse: incorrect type in argument 5 (dif=
ferent base types) @@     expected int events @@     got restricted __poll_=
t [usertype] events @@
   fs/io_uring.c:4451:52: sparse:     expected int events
   fs/io_uring.c:4451:52: sparse:     got restricted __poll_t [usertype] ev=
ents
   fs/btrfs/scrub.c:1180:25: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:1180:25: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:1180:25: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:1189:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:1189:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:1189:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:703:17: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/scrub.c:703:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:703:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:717:9: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/btrfs/scrub.c:717:9: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:717:9: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:775:25: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/scrub.c:775:25: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:775:25: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:2136:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:2136:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:2136:17: sparse:    struct rcu_string *
--
         |     ^~~~~~~~~~~~~~~
   fs/cifs/ioctl.c: In function 'cifs_ioctl':
   fs/cifs/ioctl.c:174:10: warning: variable 'caps' set but not used [-Wunu=
sed-but-set-variable]
     174 |  __u64   caps;
         |          ^~~~
   In file included from fs/btrfs/zstd.c:19:
   include/linux/zstd.h:798:21: warning: 'ZSTD_skippableHeaderSize' defined=
 but not used [-Wunused-const-variable=3D]
     798 | static const size_t ZSTD_skippableHeaderSize =3D 8;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/zstd.h:796:21: warning: 'ZSTD_frameHeaderSize_max' defined=
 but not used [-Wunused-const-variable=3D]
     796 | static const size_t ZSTD_frameHeaderSize_max =3D ZSTD_FRAMEHEADE=
RSIZE_MAX;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/zstd.h:795:21: warning: 'ZSTD_frameHeaderSize_min' defined=
 but not used [-Wunused-const-variable=3D]
     795 | static const size_t ZSTD_frameHeaderSize_min =3D ZSTD_FRAMEHEADE=
RSIZE_MIN;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/zstd.h:794:21: warning: 'ZSTD_frameHeaderSize_prefix' defi=
ned but not used [-Wunused-const-variable=3D]
     794 | static const size_t ZSTD_frameHeaderSize_prefix =3D 5;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noder=
ef] __rcu *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [nodere=
f] __rcu *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [nodere=
f] __rcu *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
   In file included from fs/btrfs/compression.c:22:
   fs/btrfs/ctree.h:2217:8: warning: type qualifiers ignored on function re=
turn type [-Wignored-qualifiers]
    2217 | size_t __const btrfs_get_num_csums(void);
         |        ^~~~~~~
   fs/signalfd.c:66:33: sparse: sparse: incorrect type in argument 2 (diffe=
rent address spaces) @@     expected struct wait_queue_head [usertype] *wai=
t_address @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:66:33: sparse:     expected struct wait_queue_head [userty=
pe] *wait_address
   fs/signalfd.c:66:33: sparse:     got struct wait_queue_head [noderef] __=
rcu *
   fs/signalfd.c:68:31: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected struct spinlock [usertype] *lock @@   =
  got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:68:31: sparse:     expected struct spinlock [usertype] *lo=
ck
   fs/signalfd.c:68:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:73:33: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected struct spinlock [usertype] *lock @@   =
  got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:73:33: sparse:     expected struct spinlock [usertype] *lo=
ck
   fs/signalfd.c:73:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:108:32: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:125:33: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:131:33: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:150:32: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:154:38: sparse: sparse: cast removes address space '__user=
' of expression
   fs/signalfd.c:172:31: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:172:31: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:172:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:181:41: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:181:41: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:181:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:185:32: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct wait_queue_head *wq_head @@   =
  got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:185:32: sparse:     expected struct wait_queue_head *wq_he=
ad
   fs/signalfd.c:185:32: sparse:     got struct wait_queue_head [noderef] _=
_rcu *
   fs/signalfd.c:195:41: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:195:41: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:195:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:197:39: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:197:39: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:197:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:199:33: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:199:33: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:199:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:201:35: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct wait_queue_head *wq_head @@   =
  got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:201:35: sparse:     expected struct wait_queue_head *wq_he=
ad
   fs/signalfd.c:201:35: sparse:     got struct wait_queue_head [noderef] _=
_rcu *
   fs/signalfd.c:301:39: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:301:39: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:301:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:303:41: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:303:41: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/signalfd.c:303:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:305:17: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct wait_queue_head *wq_head @@   =
  got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:305:17: sparse:     expected struct wait_queue_head *wq_he=
ad
   fs/signalfd.c:305:17: sparse:     got struct wait_queue_head [noderef] _=
_rcu *
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'tree' n=
ot described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'offset'=
 not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'next_re=
t' not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'prev_re=
t' not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'p_ret' =
not described in '__etree_search'
   fs/btrfs/extent_io.c:414: warning: Function parameter or member 'parent_=
ret' not described in '__etree_search'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'tree' =
not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'start'=
 not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'start_=
ret' not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'end_re=
t' not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1616: warning: Function parameter or member 'bits' =
not described in 'find_contiguous_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'tree' =
not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'start'=
 not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'start_=
ret' not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'end_re=
t' not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:1653: warning: Function parameter or member 'bits' =
not described in 'find_first_clear_extent_bit'
   fs/btrfs/extent_io.c:4152: warning: Function parameter or member 'epd' n=
ot described in 'extent_write_cache_pages'
   fs/btrfs/extent_io.c:4152: warning: Excess function parameter 'data' des=
cription in 'extent_write_cache_pages'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'root' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'inode' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'ctl' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'block_group' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'io_ctl' not described in '__btrfs_write_out_cache'
   fs/btrfs/free-space-cache.c:1260: warning: Function parameter or member =
'trans' not described in '__btrfs_write_out_cache'
   fs/cifs/smb2misc.c:630:47: sparse: sparse: undefined identifier 'lw'
>> fs/cifs/smb2misc.c:542:24: sparse: sparse: context imbalance in 'smb2_tc=
on_has_lease' - unexpected unlock
>> fs/cifs/smb2misc.c:594:1: sparse: sparse: context imbalance in 'smb2_is_=
valid_lease_break' - wrong count at exit
   fs/cifs/smb2misc.c: In function 'smb2_is_valid_lease_break':
   fs/cifs/smb2misc.c:630:12: error: 'lw' undeclared (first use in this fun=
ction)
     630 |      kfree(lw);
         |            ^~
   fs/cifs/smb2misc.c:630:12: note: each undeclared identifier is reported =
only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:281: fs/cifs/smb2misc.o] Error 1
   fs/gfs2/inode.c:297: warning: Function parameter or member 'dir' not des=
cribed in 'gfs2_lookupi'
   fs/gfs2/inode.c:297: warning: Excess function parameter 'd_gh' descripti=
on in 'gfs2_lookupi'
   fs/gfs2/inode.c:297: warning: Excess function parameter 'i_gh' descripti=
on in 'gfs2_lookupi'
   fs/gfs2/inode.c:478: warning: Excess function parameter 'bhp' descriptio=
n in 'init_dinode'
   fs/gfs2/inode.c:599: warning: Function parameter or member 'excl' not de=
scribed in 'gfs2_create_inode'
   fs/gfs2/inode.c:845: warning: Function parameter or member 'excl' not de=
scribed in 'gfs2_create'
   fs/gfs2/inode.c:1089: warning: Function parameter or member 'dentry' not=
 described in 'gfs2_unlink_inode'
   fs/gfs2/inode.c:1089: warning: Excess function parameter 'name' descript=
ion in 'gfs2_unlink_inode'
   fs/gfs2/inode.c:1089: warning: Excess function parameter 'inode' descrip=
tion in 'gfs2_unlink_inode'
   fs/gfs2/inode.c:1834: warning: Excess function parameter 'flags' descrip=
tion in 'gfs2_permission'
   fs/gfs2/inode.c:1875: warning: Function parameter or member 'inode' not =
described in 'gfs2_setattr_simple'
   In file included from fs/btrfs/delayed-ref.c:9:
   fs/btrfs/ctree.h:2217:8: warning: type qualifiers ignored on function re=
turn type [-Wignored-qualifiers]
    2217 | size_t __const btrfs_get_num_csums(void);
         |        ^~~~~~~
   fs/gfs2/recovery.c:165: warning: Function parameter or member 'head' not=
 described in 'get_log_header'
   fs/gfs2/recovery.c:165: warning: Excess function parameter 'lh' descript=
ion in 'get_log_header'
   fs/gfs2/recovery.c:195: warning: Function parameter or member 'pass' not=
 described in 'foreach_descriptor'
   fs/btrfs/delayed-ref.c:80: warning: Function parameter or member 'fs_inf=
o' not described in 'btrfs_delayed_refs_rsv_release'
   fs/btrfs/delayed-ref.c:80: warning: Function parameter or member 'nr' no=
t described in 'btrfs_delayed_refs_rsv_release'
   fs/btrfs/delayed-ref.c:128: warning: Function parameter or member 'fs_in=
fo' not described in 'btrfs_migrate_to_delayed_refs_rsv'
   fs/btrfs/delayed-ref.c:128: warning: Function parameter or member 'src' =
not described in 'btrfs_migrate_to_delayed_refs_rsv'
   fs/btrfs/delayed-ref.c:128: warning: Function parameter or member 'num_b=
ytes' not described in 'btrfs_migrate_to_delayed_refs_rsv'
   fs/btrfs/delayed-ref.c:174: warning: Function parameter or member 'fs_in=
fo' not described in 'btrfs_delayed_refs_rsv_refill'
   fs/btrfs/delayed-ref.c:174: warning: Function parameter or member 'flush=
' not described in 'btrfs_delayed_refs_rsv_refill'
   fs/eventpoll.c:1131: warning: Function parameter or member 'new' not des=
cribed in 'list_add_tail_lockless'
   fs/eventpoll.c:1131: warning: Function parameter or member 'head' not de=
scribed in 'list_add_tail_lockless'
   fs/eventpoll.c:1171: warning: Function parameter or member 'epi' not des=
cribed in 'chain_epi_lockless'
   fs/btrfs/inode.c:2953: warning: Function parameter or member 'fs_info' n=
ot described in 'btrfs_wait_on_delayed_iputs'
   In file included from fs/btrfs/relocation.c:13:
   fs/btrfs/ctree.h:2217:8: warning: type qualifiers ignored on function re=
turn type [-Wignored-qualifiers]
    2217 | size_t __const btrfs_get_num_csums(void);
         |        ^~~~~~~
   fs/xfs/xfs_extent_busy.c:572:33: sparse: sparse: context imbalance in 'x=
fs_extent_busy_clear' - unexpected unlock
   fs/io_uring.c:2350:24: sparse: sparse: incorrect type in return expressi=
on (different address spaces) @@     expected void [noderef] __user * @@   =
  got struct io_buffer *[assigned] kbuf @@
   fs/io_uring.c:2350:24: sparse:     expected void [noderef] __user *
   fs/io_uring.c:2350:24: sparse:     got struct io_buffer *[assigned] kbuf
   fs/io_uring.c:2518:40: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected void [noderef] __user *[assigned] io=
v_base @@     got void * @@
   fs/io_uring.c:2518:40: sparse:     expected void [noderef] __user *[assi=
gned] iov_base
   fs/io_uring.c:2518:40: sparse:     got void *
   fs/io_uring.c:2901:37: sparse: sparse: incorrect type in argument 2 (dif=
ferent address spaces) @@     expected long long [noderef] [usertype] __use=
r *off_in @@     got long long [usertype] *[assigned] poff_in @@
   fs/io_uring.c:2901:37: sparse:     expected long long [noderef] [usertyp=
e] __user *off_in
   fs/io_uring.c:2901:37: sparse:     got long long [usertype] *[assigned] =
poff_in
   fs/io_uring.c:2901:51: sparse: sparse: incorrect type in argument 4 (dif=
ferent address spaces) @@     expected long long [noderef] [usertype] __use=
r *off_out @@     got long long [usertype] *[assigned] poff_out @@
   fs/io_uring.c:2901:51: sparse:     expected long long [noderef] [usertyp=
e] __user *off_out
   fs/io_uring.c:2901:51: sparse:     got long long [usertype] *[assigned] =
poff_out
   fs/io_uring.c:4085:72: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[usertype] mask @@
   fs/io_uring.c:4085:72: sparse:     expected int mask
   fs/io_uring.c:4085:72: sparse:     got restricted __poll_t [usertype] ma=
sk
   fs/io_uring.c:4090:21: sparse: sparse: incorrect type in assignment (dif=
ferent base types) @@     expected unsigned int [usertype] result @@     go=
t restricted __poll_t [usertype] mask @@
   fs/io_uring.c:4090:21: sparse:     expected unsigned int [usertype] resu=
lt
   fs/io_uring.c:4090:21: sparse:     got restricted __poll_t [usertype] ma=
sk
   fs/io_uring.c:4116:29: sparse: sparse: incorrect type in assignment (dif=
ferent base types) @@     expected unsigned int [usertype] result @@     go=
t restricted __poll_t @@
   fs/io_uring.c:4116:29: sparse:     expected unsigned int [usertype] resu=
lt
   fs/io_uring.c:4116:29: sparse:     got restricted __poll_t
   fs/io_uring.c:4166:34: sparse: sparse: incorrect type in argument 2 (dif=
ferent base types) @@     expected restricted __poll_t [usertype] mask @@  =
   got unsigned int [usertype] result @@
   fs/io_uring.c:4166:34: sparse:     expected restricted __poll_t [usertyp=
e] mask
   fs/io_uring.c:4166:34: sparse:     got unsigned int [usertype] result
   fs/io_uring.c:4344:41: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[usertype] @@
   fs/io_uring.c:4344:41: sparse:     expected int mask
   fs/io_uring.c:4344:41: sparse:     got restricted __poll_t [usertype]
   fs/io_uring.c:4429:22: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:4429:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4429:22: sparse:    right side has type int
   fs/io_uring.c:4431:22: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:4431:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4431:22: sparse:    right side has type int
   fs/io_uring.c:4432:14: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:4432:14: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4432:14: sparse:    right side has type int
   fs/io_uring.c:4450:67: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[assigned] [usertype] mask @@
   fs/io_uring.c:4450:67: sparse:     expected int mask
   fs/io_uring.c:4450:67: sparse:     got restricted __poll_t [assigned] [u=
sertype] mask
   fs/io_uring.c:4451:52: sparse: sparse: incorrect type in argument 5 (dif=
ferent base types) @@     expected int events @@     got restricted __poll_=
t [usertype] events @@
   fs/io_uring.c:4451:52: sparse:     expected int events
   fs/io_uring.c:4451:52: sparse:     got restricted __poll_t [usertype] ev=
ents
   fs/btrfs/scrub.c:1180:25: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:1180:25: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:1180:25: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:1189:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:1189:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:1189:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:703:17: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/scrub.c:703:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:703:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:717:9: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/btrfs/scrub.c:717:9: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:717:9: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:775:25: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/scrub.c:775:25: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:775:25: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:2136:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:2136:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/scrub.c:2136:17: sparse:    struct rcu_string *
--
   fs/cifs/cifsglob.h:1903:41: sparse: sparse: symbol 'cifs_tcp_ses_list' w=
as not declared. Should it be static?
   fs/cifs/cifsglob.h:1915:41: sparse: sparse: symbol 'cifs_tcp_ses_lock' w=
as not declared. Should it be static?
   fs/cifs/cifsglob.h:1927:28: sparse: sparse: symbol 'GlobalCurrentXid' wa=
s not declared. Should it be static?
   fs/cifs/cifsglob.h:1928:28: sparse: sparse: symbol 'GlobalTotalActiveXid=
' was not declared. Should it be static?
   fs/cifs/cifsglob.h:1929:28: sparse: sparse: symbol 'GlobalMaxActiveXid' =
was not declared. Should it be static?
   fs/cifs/cifsglob.h:1930:26: sparse: sparse: symbol 'GlobalMid_Lock' was =
not declared. Should it be static?
   fs/cifs/cifsglob.h:1935:24: sparse: sparse: symbol 'sesInfoAllocCount' w=
as not declared. Should it be static?
   fs/cifs/cifsglob.h:1936:24: sparse: sparse: symbol 'tconInfoAllocCount' =
was not declared. Should it be static?
   fs/cifs/cifsglob.h:1937:24: sparse: sparse: symbol 'tcpSesAllocCount' wa=
s not declared. Should it be static?
   fs/cifs/cifsglob.h:1938:24: sparse: sparse: symbol 'tcpSesReconnectCount=
' was not declared. Should it be static?
   fs/cifs/cifsglob.h:1939:24: sparse: sparse: symbol 'tconInfoReconnectCou=
nt' was not declared. Should it be static?
   fs/cifs/cifsglob.h:1942:24: sparse: sparse: symbol 'bufAllocCount' was n=
ot declared. Should it be static?
   fs/cifs/cifsglob.h:1948:24: sparse: sparse: symbol 'smBufAllocCount' was=
 not declared. Should it be static?
   fs/cifs/cifsglob.h:1949:24: sparse: sparse: symbol 'midCount' was not de=
clared. Should it be static?
   fs/cifs/cifsglob.h:1964:30: sparse: sparse: symbol 'uidtree' was not dec=
lared. Should it be static?
   fs/cifs/cifsglob.h:1965:30: sparse: sparse: symbol 'gidtree' was not dec=
lared. Should it be static?
   fs/cifs/cifsglob.h:1966:26: sparse: sparse: symbol 'siduidlock' was not =
declared. Should it be static?
   fs/cifs/cifsglob.h:1967:26: sparse: sparse: symbol 'sidgidlock' was not =
declared. Should it be static?
   fs/cifs/cifsglob.h:1968:30: sparse: sparse: symbol 'siduidtree' was not =
declared. Should it be static?
   fs/cifs/cifsglob.h:1969:30: sparse: sparse: symbol 'sidgidtree' was not =
declared. Should it be static?
   fs/cifs/cifsglob.h:1970:26: sparse: sparse: symbol 'uidsidlock' was not =
declared. Should it be static?
   fs/cifs/cifsglob.h:1971:26: sparse: sparse: symbol 'gidsidlock' was not =
declared. Should it be static?
   fs/cifs/connect.c:2925: warning: Function parameter or member 'ses' not =
described in 'cifs_setup_ipc'
   fs/cifs/connect.c:2925: warning: Function parameter or member 'volume_in=
fo' not described in 'cifs_setup_ipc'
   fs/cifs/connect.c:2984: warning: Function parameter or member 'ses' not =
described in 'cifs_free_ipc'
   fs/cifs/connect.c:3233: warning: Function parameter or member 'server' n=
ot described in 'cifs_get_smb_ses'
   fs/cifs/connect.c:3233: warning: Function parameter or member 'volume_in=
fo' not described in 'cifs_get_smb_ses'
   fs/cifs/connect.c:3446: warning: Function parameter or member 'ses' not =
described in 'cifs_get_tcon'
   fs/cifs/connect.c:3446: warning: Function parameter or member 'volume_in=
fo' not described in 'cifs_get_tcon'
   fs/cifs/connect.c:4426: warning: Function parameter or member 'xid' not =
described in 'expand_dfs_referral'
   fs/cifs/connect.c:4426: warning: Function parameter or member 'ses' not =
described in 'expand_dfs_referral'
   fs/cifs/connect.c:4426: warning: Function parameter or member 'volume_in=
fo' not described in 'expand_dfs_referral'
   fs/cifs/connect.c:4426: warning: Function parameter or member 'cifs_sb' =
not described in 'expand_dfs_referral'
   fs/cifs/connect.c:4426: warning: Function parameter or member 'check_pre=
fix' not described in 'expand_dfs_referral'
   fs/cifs/inode.c: In function 'smb311_posix_get_inode_info':
   fs/cifs/inode.c:1089:26: warning: variable 'server' set but not used [-W=
unused-but-set-variable]
    1089 |  struct TCP_Server_Info *server;
         |                          ^~~~~~
   fs/cifs/file.c:421: warning: Function parameter or member 'cifs_file' no=
t described in 'cifsFileInfo_put'
   fs/cifs/file.c:440: warning: Function parameter or member 'cifs_file' no=
t described in '_cifsFileInfo_put'
   fs/cifs/file.c:440: warning: Function parameter or member 'wait_oplock_h=
andler' not described in '_cifsFileInfo_put'
   fs/cifs/file.c:440: warning: Function parameter or member 'offload' not =
described in '_cifsFileInfo_put'
   fs/cifs/inode.c:804: warning: Function parameter or member 'xid' not des=
cribed in 'cifs_backup_query_path_info'
   fs/cifs/inode.c:804: warning: Function parameter or member 'tcon' not de=
scribed in 'cifs_backup_query_path_info'
   fs/cifs/inode.c:804: warning: Function parameter or member 'sb' not desc=
ribed in 'cifs_backup_query_path_info'
   fs/cifs/inode.c:804: warning: Function parameter or member 'full_path' n=
ot described in 'cifs_backup_query_path_info'
   fs/cifs/inode.c:804: warning: Function parameter or member 'resp_buf' no=
t described in 'cifs_backup_query_path_info'
   fs/cifs/inode.c:804: warning: Function parameter or member 'data' not de=
scribed in 'cifs_backup_query_path_info'
   fs/cifs/inode.c:2211: warning: Function parameter or member 'key' not de=
scribed in 'cifs_wait_bit_killable'
   fs/cifs/inode.c:2211: warning: Function parameter or member 'mode' not d=
escribed in 'cifs_wait_bit_killable'
   fs/cifs/inode.c:2211: warning: Excess function parameter 'word' descript=
ion in 'cifs_wait_bit_killable'
   fs/cifs/misc.c:613: warning: Function parameter or member 'cfile' not de=
scribed in 'cifs_queue_oplock_break'
   fs/cifs/misc.c:928: warning: Function parameter or member 'name' not des=
cribed in 'cifs_alloc_hash'
   fs/cifs/misc.c:928: warning: Function parameter or member 'shash' not de=
scribed in 'cifs_alloc_hash'
   fs/cifs/misc.c:928: warning: Function parameter or member 'sdesc' not de=
scribed in 'cifs_alloc_hash'
   fs/cifs/misc.c:964: warning: Function parameter or member 'shash' not de=
scribed in 'cifs_free_hash'
   fs/cifs/misc.c:964: warning: Function parameter or member 'sdesc' not de=
scribed in 'cifs_free_hash'
   fs/cifs/misc.c:979: warning: Function parameter or member 'rqst' not des=
cribed in 'rqst_page_get_length'
   fs/cifs/misc.c:979: warning: Function parameter or member 'page' not des=
cribed in 'rqst_page_get_length'
   fs/cifs/misc.c:979: warning: Function parameter or member 'len' not desc=
ribed in 'rqst_page_get_length'
   fs/cifs/misc.c:979: warning: Function parameter or member 'offset' not d=
escribed in 'rqst_page_get_length'
   fs/cifs/misc.c:1012: warning: Function parameter or member 'dst' not des=
cribed in 'copy_path_name'
   fs/cifs/misc.c:1012: warning: Function parameter or member 'src' not des=
cribed in 'copy_path_name'
   fs/cifs/ioctl.c: In function 'cifs_ioctl':
   fs/cifs/ioctl.c:174:10: warning: variable 'caps' set but not used [-Wunu=
sed-but-set-variable]
     174 |  __u64   caps;
         |          ^~~~
   fs/cifs/smb2misc.c:630:47: sparse: sparse: undefined identifier 'lw'
>> fs/cifs/smb2misc.c:542:24: sparse: sparse: context imbalance in 'smb2_tc=
on_has_lease' - unexpected unlock
>> fs/cifs/smb2misc.c:594:1: sparse: sparse: context imbalance in 'smb2_is_=
valid_lease_break' - wrong count at exit
   fs/cifs/smb2misc.c: In function 'smb2_is_valid_lease_break':
   fs/cifs/smb2misc.c:630:12: error: 'lw' undeclared (first use in this fun=
ction)
     630 |      kfree(lw);
         |            ^~
   fs/cifs/smb2misc.c:630:12: note: each undeclared identifier is reported =
only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:281: fs/cifs/smb2misc.o] Error 1
   make[3]: Target '__build' not remade because of errors.
--
   fs/cifs/smb2misc.c:630:47: sparse: sparse: undefined identifier 'lw'
>> fs/cifs/smb2misc.c:542:24: sparse: sparse: context imbalance in 'smb2_tc=
on_has_lease' - unexpected unlock
>> fs/cifs/smb2misc.c:594:1: sparse: sparse: context imbalance in 'smb2_is_=
valid_lease_break' - wrong count at exit

# https://github.com/0day-ci/linux/commit/7a32ab08f9e865fa52cfb802786e6fd39=
df45ea3
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 7a32ab08f9e865fa52cfb802786e6fd39df45ea3
vim +/smb2_tcon_has_lease +542 fs/cifs/smb2misc.c

233839b1df65a2 Pavel Shilovsky 2012-09-19  506  =

0822f51426b51b Pavel Shilovsky 2012-09-19  507  static bool
7a32ab08f9e865 Paul Aurich     2020-06-29  508  smb2_tcon_has_lease(struct =
cifs_tcon *tcon, struct smb2_lease_break *rsp)
0822f51426b51b Pavel Shilovsky 2012-09-19  509  {
933d4b36576c95 Pavel Shilovsky 2013-09-05  510  	bool found;
933d4b36576c95 Pavel Shilovsky 2013-09-05  511  	__u8 lease_state;
933d4b36576c95 Pavel Shilovsky 2013-09-05  512  	struct list_head *tmp;
0822f51426b51b Pavel Shilovsky 2012-09-19  513  	struct cifsFileInfo *cfile;
233839b1df65a2 Pavel Shilovsky 2012-09-19  514  	struct cifs_pending_open *=
open;
933d4b36576c95 Pavel Shilovsky 2013-09-05  515  	struct cifsInodeInfo *cino=
de;
12e8a20824677f Steve French    2012-09-19  516  	int ack_req =3D le32_to_cp=
u(rsp->Flags &
12e8a20824677f Steve French    2012-09-19  517  				  SMB2_NOTIFY_BREAK_LEA=
SE_FLAG_ACK_REQUIRED);
7a32ab08f9e865 Paul Aurich     2020-06-29  518  	struct smb2_lease_break_wo=
rk *lw;
7a32ab08f9e865 Paul Aurich     2020-06-29  519  	struct tcon_link *tlink;
7a32ab08f9e865 Paul Aurich     2020-06-29  520  	__u8 lease_key[SMB2_LEASE_=
KEY_SIZE];
233839b1df65a2 Pavel Shilovsky 2012-09-19  521  =

53ef1016fd0e4b Pavel Shilovsky 2013-09-05  522  	lease_state =3D le32_to_cp=
u(rsp->NewLeaseState);
0822f51426b51b Pavel Shilovsky 2012-09-19  523  =

7a32ab08f9e865 Paul Aurich     2020-06-29  524  	spin_lock(&tcon->open_file=
_lock);
933d4b36576c95 Pavel Shilovsky 2013-09-05  525  	list_for_each(tmp, &tcon->=
openFileList) {
933d4b36576c95 Pavel Shilovsky 2013-09-05  526  		cfile =3D list_entry(tmp,=
 struct cifsFileInfo, tlist);
2b0143b5c986be David Howells   2015-03-17  527  		cinode =3D CIFS_I(d_inode=
(cfile->dentry));
0822f51426b51b Pavel Shilovsky 2012-09-19  528  =

0822f51426b51b Pavel Shilovsky 2012-09-19  529  		if (memcmp(cinode->lease_=
key, rsp->LeaseKey,
0822f51426b51b Pavel Shilovsky 2012-09-19  530  							SMB2_LEASE_KEY_SIZE))
0822f51426b51b Pavel Shilovsky 2012-09-19  531  			continue;
0822f51426b51b Pavel Shilovsky 2012-09-19  532  =

f96637be081141 Joe Perches     2013-05-04  533  		cifs_dbg(FYI, "found in t=
he open list\n");
59b04c5df75bd7 Steve French    2014-08-02  534  		cifs_dbg(FYI, "lease key =
match, lease break 0x%x\n",
9bd45408366840 Pavel Shilovsky 2019-10-29  535  			 lease_state);
0822f51426b51b Pavel Shilovsky 2012-09-19  536  =

233839b1df65a2 Pavel Shilovsky 2012-09-19  537  		if (ack_req)
0822f51426b51b Pavel Shilovsky 2012-09-19  538  			cfile->oplock_break_canc=
elled =3D false;
0822f51426b51b Pavel Shilovsky 2012-09-19  539  		else
0822f51426b51b Pavel Shilovsky 2012-09-19  540  			cfile->oplock_break_canc=
elled =3D true;
0822f51426b51b Pavel Shilovsky 2012-09-19  541  =

7b9b9edb49ad37 Pavel Shilovsky 2019-02-13 @542  		set_bit(CIFS_INODE_PENDIN=
G_OPLOCK_BREAK, &cinode->flags);
7b9b9edb49ad37 Pavel Shilovsky 2019-02-13  543  =

9bd45408366840 Pavel Shilovsky 2019-10-29  544  		cfile->oplock_epoch =3D l=
e16_to_cpu(rsp->Epoch);
9bd45408366840 Pavel Shilovsky 2019-10-29  545  		cfile->oplock_level =3D l=
ease_state;
7b9b9edb49ad37 Pavel Shilovsky 2019-02-13  546  =

b98749cac4a695 Aurelien Aptel  2019-03-29  547  		cifs_queue_oplock_break(c=
file);
7a32ab08f9e865 Paul Aurich     2020-06-29  548  		spin_unlock(&tcon->open_f=
ile_lock);
7a32ab08f9e865 Paul Aurich     2020-06-29  549  		spin_unlock(&cifs_tcp_ses=
_lock);
0822f51426b51b Pavel Shilovsky 2012-09-19  550  		return true;
0822f51426b51b Pavel Shilovsky 2012-09-19  551  	}
233839b1df65a2 Pavel Shilovsky 2012-09-19  552  =

233839b1df65a2 Pavel Shilovsky 2012-09-19  553  	found =3D false;
233839b1df65a2 Pavel Shilovsky 2012-09-19  554  	list_for_each_entry(open, =
&tcon->pending_opens, olist) {
233839b1df65a2 Pavel Shilovsky 2012-09-19  555  		if (memcmp(open->lease_ke=
y, rsp->LeaseKey,
233839b1df65a2 Pavel Shilovsky 2012-09-19  556  			   SMB2_LEASE_KEY_SIZE))
233839b1df65a2 Pavel Shilovsky 2012-09-19  557  			continue;
233839b1df65a2 Pavel Shilovsky 2012-09-19  558  =

233839b1df65a2 Pavel Shilovsky 2012-09-19  559  		if (!found && ack_req) {
233839b1df65a2 Pavel Shilovsky 2012-09-19  560  			found =3D true;
7a32ab08f9e865 Paul Aurich     2020-06-29  561  			memcpy(lease_key, open->=
lease_key,
233839b1df65a2 Pavel Shilovsky 2012-09-19  562  			       SMB2_LEASE_KEY_SI=
ZE);
7a32ab08f9e865 Paul Aurich     2020-06-29  563  			tlink =3D cifs_get_tlink=
(open->tlink);
233839b1df65a2 Pavel Shilovsky 2012-09-19  564  		}
233839b1df65a2 Pavel Shilovsky 2012-09-19  565  =

f96637be081141 Joe Perches     2013-05-04  566  		cifs_dbg(FYI, "found in t=
he pending open list\n");
59b04c5df75bd7 Steve French    2014-08-02  567  		cifs_dbg(FYI, "lease key =
match, lease break 0x%x\n",
9bd45408366840 Pavel Shilovsky 2019-10-29  568  			 lease_state);
233839b1df65a2 Pavel Shilovsky 2012-09-19  569  =

933d4b36576c95 Pavel Shilovsky 2013-09-05  570  		open->oplock =3D lease_st=
ate;
933d4b36576c95 Pavel Shilovsky 2013-09-05  571  	}
a93864d93977b9 Ronnie Sahlberg 2018-06-14  572  =

7a32ab08f9e865 Paul Aurich     2020-06-29  573  	spin_unlock(&tcon->open_fi=
le_lock);
7a32ab08f9e865 Paul Aurich     2020-06-29  574  	if (found) {
7a32ab08f9e865 Paul Aurich     2020-06-29  575  		spin_unlock(&cifs_tcp_ses=
_lock);
7a32ab08f9e865 Paul Aurich     2020-06-29  576  =

7a32ab08f9e865 Paul Aurich     2020-06-29  577  		lw =3D kmalloc(sizeof(str=
uct smb2_lease_break_work), GFP_KERNEL);
7a32ab08f9e865 Paul Aurich     2020-06-29  578  		if (!lw) {
7a32ab08f9e865 Paul Aurich     2020-06-29  579  			cifs_put_tlink(tlink);
7a32ab08f9e865 Paul Aurich     2020-06-29  580  			return true;
7a32ab08f9e865 Paul Aurich     2020-06-29  581  		}
7a32ab08f9e865 Paul Aurich     2020-06-29  582  =

7a32ab08f9e865 Paul Aurich     2020-06-29  583  		INIT_WORK(&lw->lease_brea=
k, cifs_ses_oplock_break);
7a32ab08f9e865 Paul Aurich     2020-06-29  584  		lw->tlink =3D tlink;
7a32ab08f9e865 Paul Aurich     2020-06-29  585  		lw->lease_state =3D rsp->=
NewLeaseState;
7a32ab08f9e865 Paul Aurich     2020-06-29  586  		memcpy(lw->lease_key, lea=
se_key, SMB2_LEASE_KEY_SIZE);
7a32ab08f9e865 Paul Aurich     2020-06-29  587  		queue_work(cifsiod_wq, &l=
w->lease_break);
7a32ab08f9e865 Paul Aurich     2020-06-29  588  	}
7a32ab08f9e865 Paul Aurich     2020-06-29  589  =

933d4b36576c95 Pavel Shilovsky 2013-09-05  590  	return found;
233839b1df65a2 Pavel Shilovsky 2012-09-19  591  }
933d4b36576c95 Pavel Shilovsky 2013-09-05  592  =

933d4b36576c95 Pavel Shilovsky 2013-09-05  593  static bool
933d4b36576c95 Pavel Shilovsky 2013-09-05 @594  smb2_is_valid_lease_break(c=
har *buffer)
933d4b36576c95 Pavel Shilovsky 2013-09-05  595  {
933d4b36576c95 Pavel Shilovsky 2013-09-05  596  	struct smb2_lease_break *r=
sp =3D (struct smb2_lease_break *)buffer;
933d4b36576c95 Pavel Shilovsky 2013-09-05  597  	struct list_head *tmp, *tm=
p1, *tmp2;
933d4b36576c95 Pavel Shilovsky 2013-09-05  598  	struct TCP_Server_Info *se=
rver;
933d4b36576c95 Pavel Shilovsky 2013-09-05  599  	struct cifs_ses *ses;
933d4b36576c95 Pavel Shilovsky 2013-09-05  600  	struct cifs_tcon *tcon;
933d4b36576c95 Pavel Shilovsky 2013-09-05  601  =

933d4b36576c95 Pavel Shilovsky 2013-09-05  602  	cifs_dbg(FYI, "Checking fo=
r lease break\n");
933d4b36576c95 Pavel Shilovsky 2013-09-05  603  =

933d4b36576c95 Pavel Shilovsky 2013-09-05  604  	/* look up tcon based on t=
id & uid */
933d4b36576c95 Pavel Shilovsky 2013-09-05  605  	spin_lock(&cifs_tcp_ses_lo=
ck);
933d4b36576c95 Pavel Shilovsky 2013-09-05  606  	list_for_each(tmp, &cifs_t=
cp_ses_list) {
933d4b36576c95 Pavel Shilovsky 2013-09-05  607  		server =3D list_entry(tmp=
, struct TCP_Server_Info, tcp_ses_list);
933d4b36576c95 Pavel Shilovsky 2013-09-05  608  =

933d4b36576c95 Pavel Shilovsky 2013-09-05  609  		list_for_each(tmp1, &serv=
er->smb_ses_list) {
933d4b36576c95 Pavel Shilovsky 2013-09-05  610  			ses =3D list_entry(tmp1,=
 struct cifs_ses, smb_ses_list);
933d4b36576c95 Pavel Shilovsky 2013-09-05  611  =

933d4b36576c95 Pavel Shilovsky 2013-09-05  612  			list_for_each(tmp2, &ses=
->tcon_list) {
933d4b36576c95 Pavel Shilovsky 2013-09-05  613  				tcon =3D list_entry(tmp=
2, struct cifs_tcon,
933d4b36576c95 Pavel Shilovsky 2013-09-05  614  						  tcon_list);
933d4b36576c95 Pavel Shilovsky 2013-09-05  615  				cifs_stats_inc(
933d4b36576c95 Pavel Shilovsky 2013-09-05  616  				    &tcon->stats.cifs_s=
tats.num_oplock_brks);
7a32ab08f9e865 Paul Aurich     2020-06-29  617  				if (smb2_tcon_has_lease=
(tcon, rsp)) {
233839b1df65a2 Pavel Shilovsky 2012-09-19  618  					return true;
233839b1df65a2 Pavel Shilovsky 2012-09-19  619  				}
a93864d93977b9 Ronnie Sahlberg 2018-06-14  620  =

a93864d93977b9 Ronnie Sahlberg 2018-06-14  621  				if (tcon->crfid.is_vali=
d &&
a93864d93977b9 Ronnie Sahlberg 2018-06-14  622  				    !memcmp(rsp->LeaseK=
ey,
a93864d93977b9 Ronnie Sahlberg 2018-06-14  623  					    tcon->crfid.fid->l=
ease_key,
a93864d93977b9 Ronnie Sahlberg 2018-06-14  624  					    SMB2_LEASE_KEY_SIZ=
E)) {
a93864d93977b9 Ronnie Sahlberg 2018-06-14  625  					INIT_WORK(&tcon->crfid=
.lease_break,
a93864d93977b9 Ronnie Sahlberg 2018-06-14  626  						  smb2_cached_lease_b=
reak);
a93864d93977b9 Ronnie Sahlberg 2018-06-14  627  					queue_work(cifsiod_wq,
a93864d93977b9 Ronnie Sahlberg 2018-06-14  628  						   &tcon->crfid.lease=
_break);
a93864d93977b9 Ronnie Sahlberg 2018-06-14  629  					spin_unlock(&cifs_tcp_=
ses_lock);
d6ac9c584a6902 Paul Aurich     2020-06-26 @630  					kfree(lw);
a93864d93977b9 Ronnie Sahlberg 2018-06-14  631  					return true;
a93864d93977b9 Ronnie Sahlberg 2018-06-14  632  				}
0822f51426b51b Pavel Shilovsky 2012-09-19  633  			}
0822f51426b51b Pavel Shilovsky 2012-09-19  634  		}
933d4b36576c95 Pavel Shilovsky 2013-09-05  635  	}
0822f51426b51b Pavel Shilovsky 2012-09-19  636  	spin_unlock(&cifs_tcp_ses_=
lock);
f96637be081141 Joe Perches     2013-05-04  637  	cifs_dbg(FYI, "Can not pro=
cess lease break - no lease matched\n");
0822f51426b51b Pavel Shilovsky 2012-09-19  638  	return false;
0822f51426b51b Pavel Shilovsky 2012-09-19  639  }
0822f51426b51b Pavel Shilovsky 2012-09-19  640  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8419660036764630941==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8419660036764630941==--

