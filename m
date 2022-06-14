Content-Type: multipart/mixed; boundary="===============7630726877568837868=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 109/367] include/linux/fortify-string.h:263:16: warning: dereference of NULL 'array' [CWE-476]
Date: Tue, 14 Jun 2022 21:49:11 +0800
Message-ID: <202206142101.e8BTIKDJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7630726877568837868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:263:16: warning: dereference of NULL 'array=
' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   879e09570c469d3320e25aa7f625ded1a2f5c24e
commit: 1cbf9e08546faaae7fcfad46d0d24707c55ced16 [109/367] xfs: track quota=
 updates during live quotacheck
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-c001-20220613 (https://download.01.org/0day-ci/arch=
ive/20220614/202206142101.e8BTIKDJ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D1cbf9e08546faaae7fcfad46d0d24707c55ced16
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 1cbf9e08546faaae7fcfad46d0d24707c55ced16
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:253,
                    from include/linux/uuid.h:12,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/scrub/quotacheck.c:6:
   fs/xfs/scrub/quotacheck.c: In function 'xfarray_load_sparse':
>> include/linux/fortify-string.h:263:16: warning: dereference of NULL 'arr=
ay' [CWE-476] [-Wanalyzer-null-dereference]
     263 |         size_t __fortify_size =3D (size_t)(size);               =
          \
         |                ^~~~~~~~~~~~~~
   include/linux/fortify-string.h:272:25: note: in expansion of macro '__fo=
rtify_memset_chk'
     272 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,           =
        \
         |                         ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/xfarray.h:62:17: note: in expansion of macro 'memset'
      62 |                 memset(rec, 0, array->obj_size);
         |                 ^~~~~~
     'xqcheck_compare_dquot': events 1-2
       |
       |fs/xfs/scrub/quotacheck.c:518:1:
       |  518 | xqcheck_compare_dquot(
       |      | ^~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xqcheck_compare_dquot'
       |......
       |  525 |         struct xfarray          *counts =3D xqcheck_counter=
s_for(xqc, dqtype);
       |      |                                           ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                                           |
       |      |                                           (2) calling 'xqch=
eck_counters_for' from 'xqcheck_compare_dquot'
       |
       +--> 'xqcheck_counters_for': events 3-4
              |
              |fs/xfs/scrub/quotacheck.h:56:1:
              |   56 | xqcheck_counters_for(
              |      | ^~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xqcheck_counters_for'
              |......
              |   60 |         switch (dqtype) {
              |      |         ~~~~~~
              |      |         |
              |      |         (4) following 'default:' branch...
              |
            'xqcheck_counters_for': event 5
              |
              |include/linux/compiler.h:34:25:
              |   34 |                         ftrace_likely_update(&______=
f, ______r,         \
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (5) ...to here
              |   35 |                                              expect,=
 is_constant);      \
              |      |                                              ~~~~~~~=
~~~~~~~~~~~~~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_ch=
eck__'
              |   45 | #  define likely(x)     (__branch_check__(x, 1, __bu=
iltin_constant_p(x)))
              |      |                          ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_linux.h:206:10: note: in expansion of macro 'likely'
              |  206 |         (likely(expr) ? (void)0 : assfail(NULL, #exp=
r, __FILE__, __LINE__))
              |      |          ^~~~~~
   fs/xfs/scrub/quotacheck.h:69:9: note: in expansion of macro 'ASSERT'
              |   69 |         ASSERT(0);
              |      |         ^~~~~~
              |
       <------+
       |
     'xqcheck_compare_dquot': events 6-7
       |
       |fs/xfs/scrub/quotacheck.c:525:43:
       |  525 |         struct xfarray          *counts =3D xqcheck_counter=
s_for(xqc, dqtype);
       |      |                                           ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                                           |
       |      |                                           (6) return of NUL=
L to 'xqcheck_compare_dquot' from 'xqcheck_counters_for'
       |......
       |  528 |         if (xchk_iscan_aborted(&xqc->iscan)) {
       |      |            ~                               =

       |      |            |
       |      |            (7) following 'false' branch...
       |
     'xqcheck_compare_dquot': event 8
       |
       |include/linux/mutex.h:187:26:
       |  187 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
       |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (8) ...to here
   fs/xfs/scrub/quotacheck.c:533:9: note: in expansion of macro 'mutex_lock'
       |  533 |         mutex_lock(&xqc->lock);
       |      |         ^~~~~~~~~~
       |
     'xqcheck_compare_dquot': event 9
       |
       |  534 |         error =3D xfarray_load_sparse(counts, dqp->q_id, &x=
cdq);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                 |
       |      |                 (9) calling 'xfarray_load_sparse' from 'xqc=
heck_compare_dquot'
       |
       +--> 'xfarray_load_sparse': events 10-11
              |
              |fs/xfs/scrub/xfarray.h:54:1:
              |   54 | xfarray_load_sparse(
              |      | ^~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (10) entry to 'xfarray_load_sparse'
              |......
              |   61 |         if (error =3D=3D -ENODATA) {
              |      |            ~
              |      |            |
              |      |            (11) following 'true' branch (when 'error=
 =3D=3D -61')...
              |
            'xfarray_load_sparse': event 12

vim +/array +263 include/linux/fortify-string.h

28e77cc1c06866 Kees Cook 2021-06-16  261  =

28e77cc1c06866 Kees Cook 2021-06-16  262  #define __fortify_memset_chk(p, c=
, size, p_size, p_size_field) ({	\
28e77cc1c06866 Kees Cook 2021-06-16 @263  	size_t __fortify_size =3D (size_=
t)(size);				\
28e77cc1c06866 Kees Cook 2021-06-16  264  	fortify_memset_chk(__fortify_siz=
e, p_size, p_size_field),	\
28e77cc1c06866 Kees Cook 2021-06-16  265  	__underlying_memset(p, c, __fort=
ify_size);			\
28e77cc1c06866 Kees Cook 2021-06-16  266  })
28e77cc1c06866 Kees Cook 2021-06-16  267  =


:::::: The code at line 263 was first introduced by commit
:::::: 28e77cc1c0686621a4d416f599cee5ab369daa0a fortify: Detect struct memb=
er overflows in memset() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7630726877568837868==--

