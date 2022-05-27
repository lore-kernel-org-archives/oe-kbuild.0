Content-Type: multipart/mixed; boundary="===============3578356047046954656=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 25/29] block/genhd.c:2190:11: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides bound...
Date: Fri, 27 May 2022 11:30:10 +0800
Message-ID: <202205271128.jSOqZpkl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3578356047046954656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   880450147e4114ab7c1fc98df8a5a6a77c9261f0
commit: 56f22b8f6853d26be82709a978e89db6856af6b4 [25/29] BACKPORT: Kbuild: =
move to -std=3Dgnu11
:::::: branch date: 3 hours ago
:::::: commit date: 9 days ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220527/202205271128.jSOqZpkl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6f4644=
d194da594562027a5d458d9fb7a20ebc39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 56f22b8f6853d26be82709a978e89db6856af6b4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~
   block/genhd.c:84:3: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
                   snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, part=
no);
                   ^~~~~~~~
   block/genhd.c:99:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(stat, 0, sizeof(struct disk_stats));
           ^~~~~~
   block/genhd.c:99:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(stat, 0, sizeof(struct disk_stats));
           ^~~~~~
   block/genhd.c:637:3: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(tbuf, BDEVT_SIZE, "%02x%02x", MAJOR(devt), MINO=
R(devt));
                   ^~~~~~~~
   block/genhd.c:637:3: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
                   snprintf(tbuf, BDEVT_SIZE, "%02x%02x", MAJOR(devt), MINO=
R(devt));
                   ^~~~~~~~
   block/genhd.c:638:3: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, BDEVT_SIZE, "%-9s", tbuf);
                   ^~~~~~~~
   block/genhd.c:638:3: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
                   snprintf(buf, BDEVT_SIZE, "%-9s", tbuf);
                   ^~~~~~~~
   block/genhd.c:640:3: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, BDEVT_SIZE, "%03x:%05x", MAJOR(devt), MINO=
R(devt));
                   ^~~~~~~~
   block/genhd.c:640:3: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
                   snprintf(buf, BDEVT_SIZE, "%03x:%05x", MAJOR(devt), MINO=
R(devt));
                   ^~~~~~~~
   block/genhd.c:965:10: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "\n");
                          ^~~~~~~
   block/genhd.c:965:10: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "\n");
                          ^~~~~~~
   block/genhd.c:1242:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", disk->minors);
                  ^~~~~~~
   block/genhd.c:1242:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", disk->minors);
                  ^~~~~~~
   block/genhd.c:1250:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", disk_max_parts(disk));
                  ^~~~~~~
   block/genhd.c:1250:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", disk_max_parts(disk));
                  ^~~~~~~
   block/genhd.c:1258:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   block/genhd.c:1258:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   block/genhd.c:1267:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   block/genhd.c:1267:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   block/genhd.c:1276:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", get_disk_ro(disk) ? 1 : 0);
                  ^~~~~~~
   block/genhd.c:1276:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", get_disk_ro(disk) ? 1 : 0);
                  ^~~~~~~
   block/genhd.c:1284:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n",
                  ^~~~~~~
   block/genhd.c:1284:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n",
                  ^~~~~~~
   block/genhd.c:1302:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf,
                  ^~~~~~~
   block/genhd.c:1302:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf,
                  ^~~~~~~
   block/genhd.c:1344:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%8u %8u\n", inflight[0], inflight[1]);
                  ^~~~~~~
   block/genhd.c:1344:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%8u %8u\n", inflight[0], inflight[1]);
                  ^~~~~~~
   block/genhd.c:1352:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%x\n", disk->flags);
                  ^~~~~~~
   block/genhd.c:1352:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%x\n", disk->flags);
                  ^~~~~~~
   block/genhd.c:1361:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", queue_alignment_offset(disk->queue));
                  ^~~~~~~
   block/genhd.c:1361:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", queue_alignment_offset(disk->queue));
                  ^~~~~~~
   block/genhd.c:1370:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", queue_discard_alignment(disk->queue)=
);
                  ^~~~~~~
   block/genhd.c:1370:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", queue_discard_alignment(disk->queue)=
);
                  ^~~~~~~
>> block/genhd.c:2190:11: warning: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D sprintf(buf + pos, "%s%s",
                                  ^~~~~~~
   block/genhd.c:2190:11: note: Call to function 'sprintf' is insecure as i=
t does not provide bounding of the memory buffer or security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           pos +=3D sprintf(buf + pos, "%s%s",
                                  ^~~~~~~
   block/genhd.c:2195:10: warning: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D sprintf(buf + pos, "\n");
                          ^~~~~~~
   block/genhd.c:2195:10: note: Call to function 'sprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'sprintf_s' in case of C11
                   pos +=3D sprintf(buf + pos, "\n");
                          ^~~~~~~
   block/genhd.c:2223:10: warning: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "-1\n");
                          ^~~~~~~
   block/genhd.c:2223:10: note: Call to function 'sprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "-1\n");
                          ^~~~~~~
   block/genhd.c:2225:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", disk->ev->poll_msecs);
                  ^~~~~~~
   block/genhd.c:2225:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", disk->ev->poll_msecs);
                  ^~~~~~~
   block/genhd.c:2235:17: warning: Call to function 'sscanf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           if (!count || !sscanf(buf, "%ld", &intv))
                          ^~~~~~
   block/genhd.c:2235:17: note: Call to function 'sscanf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sscanf_s' in case of C11
           if (!count || !sscanf(buf, "%ld", &intv))
                          ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   fs/statfs.c:62:2: warning: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(*buf));
           ^~~~~~
   fs/statfs.c:62:2: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(*buf));
           ^~~~~~
   fs/statfs.c:131:3: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:131:3: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:161:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:161:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:172:3: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:172:3: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:185:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:185:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:256:2: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp,0,sizeof(struct ustat));
           ^~~~~~
   fs/statfs.c:256:2: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
           memset(&tmp,0,sizeof(struct ustat));
           ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   fs/xfs/libxfs/xfs_defer.c:410:40: warning: Array subscript is undefined =
[clang-analyzer-core.uninitialized.ArraySubscript]
           const struct xfs_defer_op_type  *ops =3D defer_op_types[dfp->dfp=
_type];
                                                  ^
   fs/xfs/libxfs/xfs_defer.c:521:10: note: Calling 'xfs_defer_finish_noroll'
           error =3D xfs_defer_finish_noroll(tp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:465:2: note: Assuming the condition is false
           ASSERT((*tp)->t_flags & XFS_TRANS_PERM_LOG_RES);
           ^
   fs/xfs/xfs_linux.h:213:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   fs/xfs/libxfs/xfs_defer.c:465:2: note: '?' condition is true
           ASSERT((*tp)->t_flags & XFS_TRANS_PERM_LOG_RES);
           ^
   fs/xfs/xfs_linux.h:213:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_defer.c:470:9: note: Left side of '||' is false
           while (!list_empty(&dop_pending) || !list_empty(&(*tp)->t_dfops)=
) {
--
   drivers/nvme/target/configfs.c:1091:8: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(page, PAGE_SIZE, "%s\n", model);
                 ^~~~~~~~
   drivers/nvme/target/configfs.c:1129:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_model->number, new_model_number, len);
           ^~~~~~
   drivers/nvme/target/configfs.c:1129:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_model->number, new_model_number, len);
           ^~~~~~
   drivers/nvme/target/configfs.c:1243:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(page, PAGE_SIZE, "%d\n", to_nvmet_port(item)->en=
abled);
                  ^~~~~~~~
   drivers/nvme/target/configfs.c:1243:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(page, PAGE_SIZE, "%d\n", to_nvmet_port(item)->en=
abled);
                  ^~~~~~~~
   drivers/nvme/target/configfs.c:1351:11: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                           return sprintf(page, "%s\n", nvmet_ana_state[i].=
name);
                                  ^~~~~~~
   drivers/nvme/target/configfs.c:1351:11: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                           return sprintf(page, "%s\n", nvmet_ana_state[i].=
name);
                                  ^~~~~~~
   drivers/nvme/target/configfs.c:1354:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "\n");
                  ^~~~~~~
   drivers/nvme/target/configfs.c:1354:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "\n");
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   arch/arm/kernel/module-plts.c:48:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(plt->lit, fixed_plts, sizeof(fixed_plts));
           ^~~~~~
   arch/arm/kernel/module-plts.c:48:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(plt->lit, fixed_plts, sizeof(fixed_plts));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (34 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (11 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   arch/arm/kernel/devtree.c:250:6: warning: Access to field 'dt_fixup' res=
ults in a dereference of a null pointer (loaded from variable 'mdesc') [cla=
ng-analyzer-core.NullDereference]
           if (mdesc->dt_fixup)
               ^~~~~
   arch/arm/kernel/devtree.c:224:6: note: Assuming 'dt_virt' is non-null
           if (!dt_virt || !early_init_dt_verify(dt_virt))
               ^~~~~~~~
   arch/arm/kernel/devtree.c:224:6: note: Left side of '||' is false
   arch/arm/kernel/devtree.c:224:18: note: Assuming the condition is false
           if (!dt_virt || !early_init_dt_verify(dt_virt))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:224:2: note: Taking false branch
           if (!dt_virt || !early_init_dt_verify(dt_virt))
           ^
   arch/arm/kernel/devtree.c:227:2: note: Value assigned to 'mdesc'
           mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mac=
h);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:229:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/devtree.c:229:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/devtree.c:239:10: note: Assuming 'size' is <=3D 0
                   while (size > 0) {
                          ^~~~~~~~
   arch/arm/kernel/devtree.c:239:3: note: Loop condition is false. Executio=
n continues on line 244
                   while (size > 0) {
                   ^
   arch/arm/kernel/devtree.c:250:6: note: Access to field 'dt_fixup' result=
s in a dereference of a null pointer (loaded from variable 'mdesc')
           if (mdesc->dt_fixup)
               ^~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/misc/uacce/uacce.c:303:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", uacce->api_ver);
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:303:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", uacce->api_ver);
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:311:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", uacce->flags);
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:311:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", uacce->flags);
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:323:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:323:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:332:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", uacce->algs);
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:332:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", uacce->algs);
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:340:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:340:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:349:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   drivers/misc/uacce/uacce.c:349:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   fs/pstore/ram_core.c:104:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(prz->ecc_info.par, 0,
           ^~~~~~
   fs/pstore/ram_core.c:104:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(prz->ecc_info.par, 0,
           ^~~~~~
   fs/pstore/ram_core.c:265:9: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(str, len, ""
                         ^~~~~~~~
   fs/pstore/ram_core.c:265:9: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(str, len, ""
                         ^~~~~~~~
   fs/pstore/ram_core.c:269:9: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(str, len, "\nNo errors detected\n");
                         ^~~~~~~~
   fs/pstore/ram_core.c:269:9: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(str, len, "\nNo errors detected\n");
                         ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   fs/zonefs/super.c:742:16: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                   iocb->ki_pos +=3D size;
                                ^
   fs/zonefs/super.c:932:6: note: Assuming the condition is true
           if (unlikely(IS_IMMUTABLE(inode)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/zonefs/super.c:932:2: note: Taking false branch
           if (unlikely(IS_IMMUTABLE(inode)))
           ^
   fs/zonefs/super.c:935:6: note: Assuming the condition is false
           if (sb_rdonly(inode->i_sb))
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:935:2: note: Taking false branch
           if (sb_rdonly(inode->i_sb))
           ^
   fs/zonefs/super.c:939:6: note: Assuming field 'ki_pos' is < field 'i_max=
_size'
           if (iocb->ki_pos >=3D ZONEFS_I(inode)->i_max_size)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:939:2: note: Taking false branch
           if (iocb->ki_pos >=3D ZONEFS_I(inode)->i_max_size)
           ^
   fs/zonefs/super.c:942:6: note: Assuming the condition is true
           if (iocb->ki_flags & IOCB_DIRECT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:942:2: note: Taking true branch
           if (iocb->ki_flags & IOCB_DIRECT) {
           ^
   fs/zonefs/super.c:943:17: note: Calling 'zonefs_file_dio_write'
                   ssize_t ret =3D zonefs_file_dio_write(iocb, from);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:835:6: note: Assuming field 'i_ztype' is not equal to =
ZONEFS_ZTYPE_SEQ
           if (zi->i_ztype =3D=3D ZONEFS_ZTYPE_SEQ && !sync &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:835:38: note: Left side of '&&' is false
           if (zi->i_ztype =3D=3D ZONEFS_ZTYPE_SEQ && !sync &&
                                               ^
   fs/zonefs/super.c:839:6: note: Assuming the condition is true
           if (iocb->ki_flags & IOCB_NOWAIT) {
--
           ^~~~~~~
   drivers/nvme/target/discovery.c:140:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(traddr, port->disc_addr.traddr, NVMF_TRADDR_SIZE);
                   ^~~~~~
   drivers/nvme/target/discovery.c:140:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(traddr, port->disc_addr.traddr, NVMF_TRADDR_SIZE);
                   ^~~~~~
   drivers/nvme/target/discovery.c:264:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(id->sn, ' ', sizeof(id->sn));
           ^~~~~~
   drivers/nvme/target/discovery.c:264:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(id->sn, ' ', sizeof(id->sn));
           ^~~~~~
   drivers/nvme/target/discovery.c:267:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(id->fr, ' ', sizeof(id->fr));
           ^~~~~~
   drivers/nvme/target/discovery.c:267:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(id->fr, ' ', sizeof(id->fr));
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/mfd/abx500-core.c:45:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dev_entry->ops, ops, sizeof(*ops));
           ^~~~~~
   drivers/mfd/abx500-core.c:45:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dev_entry->ops, ops, sizeof(*ops));
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/mmc/core/sdio_bus.c:42:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   sdio_config_attr(class, "0x%02x\n", func->class);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:42:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   sdio_config_attr(class, "0x%02x\n", func->class);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:43:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   sdio_config_attr(vendor, "0x%04x\n", func->vendor);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:43:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   sdio_config_attr(vendor, "0x%04x\n", func->vendor);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:44:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   sdio_config_attr(device, "0x%04x\n", func->device);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:44:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   sdio_config_attr(device, "0x%04x\n", func->device);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:45:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   sdio_config_attr(revision, "%u.%u\n", func->major_rev, func->minor_rev);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:45:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   sdio_config_attr(revision, "%u.%u\n", func->major_rev, func->minor_rev);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:46:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   sdio_config_attr(modalias, "sdio:c%02Xv%04Xd%04X\n", func->class, func->=
vendor, func->device);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:46:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   sdio_config_attr(modalias, "sdio:c%02Xv%04Xd%04X\n", func->class, func->=
vendor, func->device);
   ^
   drivers/mmc/core/sdio_bus.c:38:9: note: expanded from macro 'sdio_config=
_attr'
           return sprintf(buf, format_string, args);                       \
                  ^~~~~~~
>> drivers/mmc/core/sdio_bus.c:61:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
   sdio_info_attr(1);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:61:1: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
   sdio_info_attr(1);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:62:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
   sdio_info_attr(2);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:62:1: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
   sdio_info_attr(2);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:63:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
   sdio_info_attr(3);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:63:1: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
   sdio_info_attr(3);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:64:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
   sdio_info_attr(4);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio_bus.c:64:1: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
   sdio_info_attr(4);
   ^
   drivers/mmc/core/sdio_bus.c:57:9: note: expanded from macro 'sdio_info_a=
ttr'
           return sprintf(buf, "%s\n", func->info[num-1]);                 =
                        \
                  ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   lib/irq_poll.c:181:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(iop, 0, sizeof(*iop));
           ^~~~~~
   lib/irq_poll.c:181:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(iop, 0, sizeof(*iop));
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (43 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (43 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   security/keys/gc.c:366:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
           ^~~~~~
   security/keys/gc.c:366:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   kernel/resource.c:80:2: warning: The expression is an uninitialized valu=
e. The computed value will also be garbage [clang-analyzer-core.uninitializ=
ed.Assign]
           (*pos)++;
           ^
   kernel/resource.c:1610:2: note: 'l' declared without an initial value
           loff_t l;
           ^~~~~~~~
   kernel/resource.c:1612:2: note: Loop condition is false.  Exiting loop
           read_lock(&resource_lock);
           ^
   include/linux/rwlock.h:71:26: note: expanded from macro 'read_lock'
   #define read_lock(lock)         _raw_read_lock(lock)
                                   ^
   include/linux/spinlock_api_up.h:60:32: note: expanded from macro '_raw_r=
ead_lock'
   #define _raw_read_lock(lock)                    __LOCK(lock)
--
   kernel/sysctl.c:1496:4: note: Taking false branch
                           if ((left <=3D 1) && skipped) {
                           ^
   kernel/sysctl.c:1501:8: note: 'err' is 0
                           if (err)
                               ^~~
   kernel/sysctl.c:1501:4: note: Taking false branch
                           if (err)
                           ^
   kernel/sysctl.c:1503:8: note: Assuming 'val_a' is < 'bitmap_len'
                           if (val_a >=3D bitmap_len || neg) {
                               ^~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:1503:8: note: Left side of '||' is false
   kernel/sysctl.c:1503:31: note: 'neg' is false
                           if (val_a >=3D bitmap_len || neg) {
                                                      ^~~
   kernel/sysctl.c:1503:4: note: Taking false branch
                           if (val_a >=3D bitmap_len || neg) {
                           ^
   kernel/sysctl.c:1509:8: note: Assuming 'left' is 0
                           if (left) {
                               ^~~~
   kernel/sysctl.c:1509:4: note: Taking false branch
                           if (left) {
                           ^
   kernel/sysctl.c:1514:10: note: The left operand of '=3D=3D' is a garbage=
 value
                           if (c =3D=3D '-') {
                               ~ ^
   kernel/sysctl.c:1541:4: warning: Value stored to 'first' is never read [=
clang-analyzer-deadcode.DeadStores]
                           first =3D 0;
                           ^       ~
   kernel/sysctl.c:1541:4: note: Value stored to 'first' is never read
                           first =3D 0;
                           ^       ~
   Suppressed 92 warnings (90 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/staging/fieldbus/dev_core.c:31:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!fb->online);
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:31:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!fb->online);
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:42:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!fb->enable_get(fb));
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:42:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!fb->enable_get(fb));
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:73:9: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
                  ^~~~~~~~
   drivers/staging/fieldbus/dev_core.c:73:9: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
                  ^~~~~~~~
   drivers/staging/fieldbus/dev_core.c:82:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%zu\n", fb->read_area_sz);
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:82:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%zu\n", fb->read_area_sz);
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:91:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%zu\n", fb->write_area_sz);
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:91:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%zu\n", fb->write_area_sz);
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:119:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", t);
                  ^~~~~~~
   drivers/staging/fieldbus/dev_core.c:119:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", t);
                  ^~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   lib/genalloc.c:445:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(vaddr, 0, size);
                   ^~~~~~
   lib/genalloc.c:445:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(vaddr, 0, size);
                   ^~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   lib/842/842_compress.c:534:4: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/842/842_compress.c:534:4: note: Value stored to 'ret' is never read
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/842/842_compress.c:598:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p->out, 0, pad);
                   ^~~~~~
   lib/842/842_compress.c:598:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(p->out, 0, pad);
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> fs/filesystems.c:220:10: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf+len, "%s\t%s\n",
                          ^~~~~~~
   fs/filesystems.c:220:10: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
                   len +=3D sprintf(buf+len, "%s\t%s\n",
                          ^~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   fs/affs/namei.c:22:34: warning: Although the value stored to 'ch' is use=
d in the enclosing expression, the value is never actually read from 'ch' [=
clang-analyzer-deadcode.DeadStores]
           return ch >=3D 'a' && ch <=3D 'z' ? ch -=3D ('a' - 'A') : ch;
                                           ^     ~~~~~~~~~~~
   fs/affs/namei.c:22:34: note: Although the value stored to 'ch' is used i=
n the enclosing expression, the value is never actually read from 'ch'
           return ch >=3D 'a' && ch <=3D 'z' ? ch -=3D ('a' - 'A') : ch;
                                           ^     ~~~~~~~~~~~
   fs/affs/namei.c:486:2: warning: Value stored to 'retval' is never read [=
clang-analyzer-deadcode.DeadStores]
           retval =3D affs_insert_hash(new_dir, bh_old);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/namei.c:486:2: note: Value stored to 'retval' is never read
           retval =3D affs_insert_hash(new_dir, bh_old);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/hid/hid-cmedia.c:86:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cm->switch_map, jack_switch_types, sizeof(cm->switch_map)=
);
           ^~~~~~
   drivers/hid/hid-cmedia.c:86:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(cm->switch_map, jack_switch_types, sizeof(cm->switch_map)=
);
           ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   include/linux/hid.h:1047:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-ite.c:38:7: note: Assuming the condition is true
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-ite.c:38:6: note: Left side of '&&' is true
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
               ^
   drivers/hid/hid-ite.c:39:6: note: Assuming the condition is true
               (usage->hid & HID_USAGE_PAGE) =3D=3D 0x00880000) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-ite.c:38:2: note: Taking true branch
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
           ^
   drivers/hid/hid-ite.c:40:7: note: Assuming field 'hid' is equal to 89130=
16
                   if (usage->hid =3D=3D 0x00880078) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-ite.c:40:3: note: Taking true branch
                   if (usage->hid =3D=3D 0x00880078) {
                   ^
   drivers/hid/hid-ite.c:42:4: note: Calling 'hid_map_usage_clear'
                           hid_map_usage_clear(hi, usage, bit, max, EV_KEY,=
 KEY_F22);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/hid.h:1068:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1022:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1026:2: note: Control jumps to 'case 1:'  at line 10=
35
           switch (type) {
           ^
   include/linux/hid.h:1038:3: note:  Execution continues on line 1045
                   break;
                   ^
   include/linux/hid.h:1045:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1045:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1045:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1045:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1045:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1046:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
--
                           if (page_block) {
                           ^
   fs/mpage.c:572:8: note: Assuming 'boundary' is 0
                           if (boundary) {
                               ^~~~~~~~
   fs/mpage.c:572:4: note: Taking false branch
                           if (boundary) {
                           ^
   fs/mpage.c:577:12: note: Assuming the condition is false
                   } while ((bh =3D bh->b_this_page) !=3D head);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:547:3: note: Loop condition is false.  Exiting loop
                   do {
                   ^
   fs/mpage.c:579:7: note: Assuming 'first_unmapped' is not equal to 0
                   if (first_unmapped)
                       ^~~~~~~~~~~~~~
   fs/mpage.c:579:3: note: Taking true branch
                   if (first_unmapped)
                   ^
   fs/mpage.c:580:4: note: Control jumps to line 626
                           goto page_is_mapped;
                           ^
   fs/mpage.c:627:6: note: Assuming 'end_index' is > field 'index'
           if (page->index >=3D end_index) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:627:2: note: Taking false branch
           if (page->index >=3D end_index) {
           ^
   fs/mpage.c:646:6: note: Assuming 'bio' is non-null
           if (bio && mpd->last_block_in_bio !=3D blocks[0] - 1)
               ^~~
   fs/mpage.c:646:6: note: Left side of '&&' is true
   fs/mpage.c:646:13: note: Assuming the condition is false
           if (bio && mpd->last_block_in_bio !=3D blocks[0] - 1)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:646:2: note: Taking false branch
           if (bio && mpd->last_block_in_bio !=3D blocks[0] - 1)
           ^
   fs/mpage.c:650:6: note: 'bio' is not equal to NULL
           if (bio =3D=3D NULL) {
               ^~~
   fs/mpage.c:650:2: note: Taking false branch
           if (bio =3D=3D NULL) {
           ^
   fs/mpage.c:672:6: note: Assuming the condition is false
           if (bio_add_page(bio, page, length, 0) < length) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:672:2: note: Taking false branch
           if (bio_add_page(bio, page, length, 0) < length) {
           ^
   fs/mpage.c:679:2: note: Assuming the condition is true
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:63:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/mpage.c:679:2: note: Taking false branch
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/mpage.c:679:2: note: Loop condition is false.  Exiting loop
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/mpage.c:682:6: note: 'boundary' is 0
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
               ^~~~~~~~
   fs/mpage.c:682:6: note: Left side of '||' is false
   fs/mpage.c:682:19: note: 'first_unmapped' is equal to 'blocks_per_page'
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
                            ^~~~~~~~~~~~~~
   fs/mpage.c:682:2: note: Taking false branch
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
           ^
   fs/mpage.c:689:26: note: Assigned value is garbage or undefined
                   mpd->last_block_in_bio =3D blocks[blocks_per_page - 1];
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/auxdisplay/img-ascii-lcd.c:288:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ctx->curr, ' ', ctx->cfg->num_chars);
                   ^~~~~~
   drivers/auxdisplay/img-ascii-lcd.c:288:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(ctx->curr, ' ', ctx->cfg->num_chars);
                   ^~~~~~
   drivers/auxdisplay/img-ascii-lcd.c:297:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_msg, msg, count);
           ^~~~~~
   drivers/auxdisplay/img-ascii-lcd.c:297:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_msg, msg, count);
           ^~~~~~
>> drivers/auxdisplay/img-ascii-lcd.c:329:9: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
           return sprintf(buf, "%s\n", ctx->message);
                  ^~~~~~~
   drivers/auxdisplay/img-ascii-lcd.c:329:9: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
           return sprintf(buf, "%s\n", ctx->message);
                  ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   drivers/input/serio/serio.c:347:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", serio->name);
                  ^~~~~~~
   drivers/input/serio/serio.c:347:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", serio->name);
                  ^~~~~~~
   drivers/input/serio/serio.c:354:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "serio:ty%02Xpr%02Xid%02Xex%02X\n",
                  ^~~~~~~
   drivers/input/serio/serio.c:354:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "serio:ty%02Xpr%02Xid%02Xex%02X\n",
                  ^~~~~~~
   drivers/input/serio/serio.c:361:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", serio->id.type);
                  ^~~~~~~
   drivers/input/serio/serio.c:361:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", serio->id.type);
                  ^~~~~~~
   drivers/input/serio/serio.c:367:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", serio->id.proto);
                  ^~~~~~~
   drivers/input/serio/serio.c:367:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", serio->id.proto);
                  ^~~~~~~
   drivers/input/serio/serio.c:373:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", serio->id.id);
                  ^~~~~~~
   drivers/input/serio/serio.c:373:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", serio->id.id);
                  ^~~~~~~
   drivers/input/serio/serio.c:379:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", serio->id.extra);
                  ^~~~~~~
   drivers/input/serio/serio.c:379:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", serio->id.extra);
                  ^~~~~~~
   drivers/input/serio/serio.c:416:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", serio->manual_bind ? "manual" : "aut=
o");
                  ^~~~~~~
   drivers/input/serio/serio.c:416:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", serio->manual_bind ? "manual" : "aut=
o");
                  ^~~~~~~
   drivers/input/serio/serio.c:440:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", serio->firmware_id);
                  ^~~~~~~
   drivers/input/serio/serio.c:440:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", serio->firmware_id);
                  ^~~~~~~
   drivers/input/serio/serio.c:738:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", driver->description ? driver->descri=
ption : "(none)");
                  ^~~~~~~
   drivers/input/serio/serio.c:738:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", driver->description ? driver->descri=
ption : "(none)");
                  ^~~~~~~
   drivers/input/serio/serio.c:745:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", serio_drv->manual_bind ? "manual" : =
"auto");
                  ^~~~~~~
   drivers/input/serio/serio.c:745:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", serio_drv->manual_bind ? "manual" : =
"auto");
                  ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
   fs/nilfs2/sysfs.c:111:9: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%llu\n",
                  ^~~~~~~~
   fs/nilfs2/sysfs.c:111:9: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%llu\n",
                  ^~~~~~~~
   fs/nilfs2/sysfs.c:119:9: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%llu\n",
                  ^~~~~~~~
   fs/nilfs2/sysfs.c:119:9: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%llu\n",
                  ^~~~~~~~
   fs/nilfs2/sysfs.c:132:9: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, snapshot_readme_str);
                  ^~~~~~~~
   fs/nilfs2/sysfs.c:132:9: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, snapshot_readme_str);
--
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:678:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(scr, "%08x%08x\n", card->raw_scr[0], card->raw_scr[1]);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:678:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(scr, "%08x%08x\n", card->raw_scr[0], card->raw_scr[1]);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:679:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(ssr,
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:679:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(ssr,
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:687:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(date, "%02d/%04d\n", card->cid.month, card->cid.year);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:687:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(date, "%02d/%04d\n", card->cid.month, card->cid.year);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:688:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(erase_size, "%u\n", card->erase_size << 9);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:688:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(erase_size, "%u\n", card->erase_size << 9);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:689:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(preferred_erase_size, "%u\n", card->pref_erase << 9);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:689:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(preferred_erase_size, "%u\n", card->pref_erase << 9);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:690:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(fwrev, "0x%x\n", card->cid.fwrev);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:690:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(fwrev, "0x%x\n", card->cid.fwrev);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:691:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(hwrev, "0x%x\n", card->cid.hwrev);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:691:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(hwrev, "0x%x\n", card->cid.hwrev);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:692:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(manfid, "0x%06x\n", card->cid.manfid);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:692:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(manfid, "0x%06x\n", card->cid.manfid);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
>> drivers/mmc/core/sd.c:693:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
   MMC_DEV_ATTR(name, "%s\n", card->cid.prod_name);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:693:1: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
   MMC_DEV_ATTR(name, "%s\n", card->cid.prod_name);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:694:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(oemid, "0x%04x\n", card->cid.oemid);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:694:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(oemid, "0x%04x\n", card->cid.oemid);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:695:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(serial, "0x%08x\n", card->cid.serial);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:695:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(serial, "0x%08x\n", card->cid.serial);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:696:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:696:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:697:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:697:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:708:23: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                  return sprintf(buf, "0x%x\n", host->dsr);
                         ^~~~~~~
   drivers/mmc/core/sd.c:708:23: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                  return sprintf(buf, "0x%x\n", host->dsr);
                         ^~~~~~~
   drivers/mmc/core/sd.c:711:23: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                  return sprintf(buf, "0x%x\n", 0x404);
                         ^~~~~~~
   drivers/mmc/core/sd.c:711:23: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                  return sprintf(buf, "0x%x\n", 0x404);
                         ^~~~~~~
   drivers/mmc/core/sd.c:716:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(vendor, "0x%04x\n", card->cis.vendor);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:716:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(vendor, "0x%04x\n", card->cis.vendor);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:717:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(device, "0x%04x\n", card->cis.device);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:717:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(device, "0x%04x\n", card->cis.device);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sd.c:718:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(revision, "%u.%u\n", card->major_rev, card->minor_rev);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
--
                           ^~~~~~
   drivers/edac/edac_mc.c:1119:4: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                           strcpy(p, dimm->label);
                           ^~~~~~
   drivers/edac/edac_mc.c:1152:14: warning: The left operand of '<' is a ga=
rbage value due to array index out of bounds [clang-analyzer-core.Undefined=
BinaryOperatorResult]
                   if (pos[i] < 0)
                       ~~~~~~ ^
   drivers/edac/edac_mc.c:1035:2: note: Taking false branch
           edac_dbg(3, "MC%d\n", mci->mc_idx);
           ^
   drivers/edac/edac_mc.h:84:2: note: expanded from macro 'edac_dbg'
           if (0)                                                          \
           ^
   drivers/edac/edac_mc.c:1035:2: note: Loop condition is false.  Exiting l=
oop
           edac_dbg(3, "MC%d\n", mci->mc_idx);
           ^
   drivers/edac/edac_mc.h:82:39: note: expanded from macro 'edac_dbg'
   #define edac_dbg(level, fmt, ...)                                       \
                                                                           ^
   drivers/edac/edac_mc.c:1048:11: note: '?' condition is true
           e->msg =3D msg ?: "";
                    ^
   drivers/edac/edac_mc.c:1049:20: note: '?' condition is true
           e->other_detail =3D other_detail ?: "";
                             ^
   drivers/edac/edac_mc.c:1056:14: note: Assuming 'i' is >=3D field 'n_laye=
rs'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1056:2: note: Loop condition is false. Execution =
continues on line 1086
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1089:2: note: Loop condition is false. Execution =
continues on line 1141
           mci_for_each_dimm(mci, dimm) {
           ^
   include/linux/edac.h:600:2: note: expanded from macro 'mci_for_each_dimm'
           for ((dimm) =3D (mci)->dimms[0];                          \
           ^
   drivers/edac/edac_mc.c:1141:6: note: 'any_memory' is true
           if (any_memory)
               ^~~~~~~~~~
   drivers/edac/edac_mc.c:1141:2: note: Taking true branch
           if (any_memory)
           ^
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:7: note: Assuming the condition is true
                   if (pos[i] < 0)
                       ^~~~~~~~~~
   drivers/edac/edac_mc.c:1152:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   drivers/edac/edac_mc.c:1153:4: note:  Execution continues on line 1151
                           continue;
                           ^
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:7: note: Assuming the condition is true
                   if (pos[i] < 0)
                       ^~~~~~~~~~
   drivers/edac/edac_mc.c:1152:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   drivers/edac/edac_mc.c:1153:4: note:  Execution continues on line 1151
                           continue;
                           ^
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:7: note: Assuming the condition is true
                   if (pos[i] < 0)
                       ^~~~~~~~~~
   drivers/edac/edac_mc.c:1152:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   drivers/edac/edac_mc.c:1153:4: note:  Execution continues on line 1151
                           continue;
                           ^
   drivers/edac/edac_mc.c:1151:33: note: The value 3 is assigned to 'i'
           for (i =3D 0; i < mci->n_layers; i++) {
                                          ^~~
   drivers/edac/edac_mc.c:1151:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1151:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1152:14: note: The left operand of '<' is a garba=
ge value due to array index out of bounds
                   if (pos[i] < 0)
                       ~~~~~~ ^
>> drivers/edac/edac_mc.c:1155:8: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   p +=3D sprintf(p, "%s:%d ",
                        ^~~~~~~
   drivers/edac/edac_mc.c:1155:8: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   p +=3D sprintf(p, "%s:%d ",
                        ^~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   crypto/seqiv.c:33:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(req->iv, subreq->iv, crypto_aead_ivsize(geniv));
           ^~~~~~
   crypto/seqiv.c:33:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(req->iv, subreq->iv, crypto_aead_ivsize(geniv));
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/char/virtio_console.c:681:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((__force char *)out_buf, buf->buf + buf->offset,
                   ^~~~~~
   drivers/char/virtio_console.c:681:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy((__force char *)out_buf, buf->buf + buf->offset,
                   ^~~~~~
   drivers/char/virtio_console.c:896:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(page_address(page) + offset, src + buf->offset, l=
en);
                   ^~~~~~
   drivers/char/virtio_console.c:896:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(page_address(page) + offset, src + buf->offset, l=
en);
                   ^~~~~~
   drivers/char/virtio_console.c:1282:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buffer, "%s\n", port->name);
                  ^~~~~~~
   drivers/char/virtio_console.c:1282:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buffer, "%s\n", port->name);
                  ^~~~~~~
   drivers/char/virtio_console.c:1464:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u=
",
                   ^~~~~~~~
   drivers/char/virtio_console.c:1464:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u=
",
                   ^~~~~~~~
   drivers/char/virtio_console.c:1627:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&size, buf->buf + buf->offset + sizeof(*cpkt),
                   ^~~~~~
   drivers/char/virtio_console.c:1627:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&size, buf->buf + buf->offset + sizeof(*cpkt),
                   ^~~~~~
   drivers/char/virtio_console.c:1675:3: warning: Call to function 'strncpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(port->name, buf->buf + buf->offset + sizeof(*cpk=
t),
                   ^~~~~~~
   drivers/char/virtio_console.c:1675:3: note: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(port->name, buf->buf + buf->offset + sizeof(*cpk=
t),
                   ^~~~~~~
   drivers/char/virtio_console.c:2046:6: warning: Called function pointer i=
s null (null dereference) [clang-analyzer-core.CallAndMessage]
               virtio_cread_feature(vdev, VIRTIO_CONSOLE_F_MULTIPORT,
               ^
   include/linux/virtio_config.h:547:17: note: expanded from macro 'virtio_=
cread_feature'
                           virtio_cread((vdev), structname, member, ptr);  \
                           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/virtio_config.h:341:4: note: expanded from macro 'virtio_c=
read'
                           vdev->config->get((vdev),                       \
                           ^~~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:2007:15: note: Assuming 'early_put_chars' =
is equal to NULL
           bool early =3D early_put_chars !=3D NULL;
                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:2010:6: note: Assuming field 'get' is null
           if (!vdev->config->get &&
               ^~~~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:2010:6: note: Left side of '&&' is true
   drivers/char/virtio_console.c:2011:7: note: Assuming the condition is fa=
lse
               (virtio_has_feature(vdev, VIRTIO_CONSOLE_F_SIZE)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:2011:7: note: Left side of '||' is false
   drivers/char/virtio_console.c:2012:10: note: Assuming the condition is f=
alse
                || virtio_has_feature(vdev, VIRTIO_CONSOLE_F_MULTIPORT))) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:2010:2: note: Taking false branch
           if (!vdev->config->get &&
           ^
   drivers/char/virtio_console.c:2021:12: note: Calling 'kmalloc'
           portdev =3D kmalloc(sizeof(*portdev), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:2021:12: note: Returning from 'kmalloc'
           portdev =3D kmalloc(sizeof(*portdev), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:2022:6: note: Assuming 'portdev' is non-nu=
ll
           if (!portdev) {
               ^~~~~~~~
   drivers/char/virtio_console.c:2022:2: note: Taking false branch
           if (!portdev) {
           ^
   drivers/char/virtio_console.c:2033:6: note: Assuming field 'chr_major' i=
s >=3D 0
           if (portdev->chr_major < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~
--
                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:205:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", st->fclkin);
                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:244:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", st->fexcit);
                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:244:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", st->fexcit);
                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:285:25: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret < 0 ? ret : sprintf(buf, "0x%x\n", ret);
                                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:285:25: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           return ret < 0 ? ret : sprintf(buf, "0x%x\n", ret);
                                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:336:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->resolution);
                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:336:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->resolution);
                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:395:21: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret ? ret : sprintf(buf, "0x%x\n", ret);
                              ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:395:21: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           return ret ? ret : sprintf(buf, "0x%x\n", ret);
                              ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:434:25: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret < 0 ? ret : sprintf(buf, "%d\n", ret);
                                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:434:25: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           return ret < 0 ? ret : sprintf(buf, "%d\n", ret);
                                  ^~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:502:3: warning: Value stored to =
'negative' is never read [clang-analyzer-deadcode.DeadStores]
                   negative =3D st->rx[0] & 0x80;
                   ^          ~~~~~~~~~~~~~~~~
   drivers/staging/iio/resolver/ad2s1210.c:502:3: note: Value stored to 'ne=
gative' is never read
                   negative =3D st->rx[0] & 0x80;
                   ^          ~~~~~~~~~~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   lib/kobject_uevent.c:435:4: warning: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(env->envp[i], env->envp[i + 1],
                           ^~~~~~~
   lib/kobject_uevent.c:435:4: note: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11
                           memmove(env->envp[i], env->envp[i + 1],
                           ^~~~~~~
   lib/kobject_uevent.c:665:8: warning: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   lib/kobject_uevent.c:665:8: note: Call to function 'vsnprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/hwtracing/stm/policy.c:95:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count =3D sprintf(page, "%u %u\n", policy_node->first_master,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:95:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           count =3D sprintf(page, "%u %u\n", policy_node->first_master,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:111:6: warning: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:111:6: note: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:142:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count =3D sprintf(page, "%u %u\n", policy_node->first_channel,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:142:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           count =3D sprintf(page, "%u %u\n", policy_node->first_channel,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:158:6: warning: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:158:6: note: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:299:10: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:299:10: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:315:10: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:315:10: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/iio/industrialio-trigger.c:53:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", trig->name);
                  ^~~~~~~
   drivers/iio/industrialio-trigger.c:53:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n", trig->name);
                  ^~~~~~~
   drivers/iio/industrialio-trigger.c:380:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   return sprintf(buf, "%s\n", indio_dev->trig->name);
                          ^~~~~~~
   drivers/iio/industrialio-trigger.c:380:10: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   return sprintf(buf, "%s\n", indio_dev->trig->name);
                          ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/iio/magnetometer/rm3100-core.c:489:4: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(data->buffer + i * 4, data->buffer + i *=
 3, 3);
                           ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:489:4: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                           memmove(data->buffer + i * 4, data->buffer + i *=
 3, 3);
                           ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:496:3: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:496:3: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:503:3: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:503:3: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:510:3: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(data->buffer + 4, data->buffer + 6, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:510:3: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(data->buffer + 4, data->buffer + 6, 3);
                   ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   kernel/sched/core.c:4658:16: warning: Value stored to 'preempt_disable_i=
p' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:4658:16: note: Value stored to 'preempt_disable_ip' =
during its initialization is never read
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:6475:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:6475:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:7954:3: warning: Value stored to 'ptr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D nr_cpu_ids * sizeof(void **);
                   ^
   kernel/sched/core.c:7954:3: note: Value stored to 'ptr' is never read
   kernel/sched/core.c:9239:6: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%20s %llu", tok, periodp) < 1)
               ^~~~~~
   kernel/sched/core.c:9239:6: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%20s %llu", tok, periodp) < 1)
               ^~~~~~
   kernel/sched/core.c:9244:6: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(tok, "%llu", quotap))
               ^~~~~~
   kernel/sched/core.c:9244:6: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
           if (sscanf(tok, "%llu", quotap))
               ^~~~~~
   Suppressed 69 warnings (61 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   fs/xfs/libxfs/xfs_refcount_btree.c:64:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&args, 0, sizeof(args));
           ^~~~~~
   fs/xfs/libxfs/xfs_refcount_btree.c:64:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&args, 0, sizeof(args));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
--
           ^
   kernel/bpf/verifier.c:11035:22: note: Assuming 'size' is < 'ctx_field_si=
ze'
                   is_narrower_load =3D size < ctx_field_size;
                                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11038:7: note: 'is_narrower_load' is true
                   if (is_narrower_load) {
                       ^~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11038:3: note: Taking true branch
                   if (is_narrower_load) {
                   ^
   kernel/bpf/verifier.c:11041:8: note: 'type' is not equal to BPF_WRITE
                           if (type =3D=3D BPF_WRITE) {
                               ^~~~
   kernel/bpf/verifier.c:11041:4: note: Taking false branch
                           if (type =3D=3D BPF_WRITE) {
                           ^
   kernel/bpf/verifier.c:11047:8: note: 'ctx_field_size' is not equal to 4
                           if (ctx_field_size =3D=3D 4)
                               ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11047:4: note: Taking false branch
                           if (ctx_field_size =3D=3D 4)
                           ^
   kernel/bpf/verifier.c:11049:13: note: 'ctx_field_size' is not equal to 8
                           else if (ctx_field_size =3D=3D 8)
                                    ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11049:9: note: Taking false branch
                           else if (ctx_field_size =3D=3D 8)
                                ^
   kernel/bpf/verifier.c:11059:7: note: Assuming 'cnt' is not equal to 0
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                       ^~~~~~~~
   kernel/bpf/verifier.c:11059:7: note: Left side of '||' is false
   kernel/bpf/verifier.c:11059:19: note: Assuming the condition is false
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11059:7: note: Left side of '||' is false
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                       ^
   kernel/bpf/verifier.c:11060:8: note: 'ctx_field_size' is not equal to 0
                       (ctx_field_size && !target_size)) {
                        ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11060:8: note: Left side of '&&' is true
   kernel/bpf/verifier.c:11060:26: note: Assuming 'target_size' is not equa=
l to 0
                       (ctx_field_size && !target_size)) {
                                          ^~~~~~~~~~~~
   kernel/bpf/verifier.c:11059:3: note: Taking false branch
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                   ^
   kernel/bpf/verifier.c:11065:7: note: 'is_narrower_load' is true
                   if (is_narrower_load && size < target_size) {
                       ^~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11065:7: note: Left side of '&&' is true
   kernel/bpf/verifier.c:11065:27: note: Assuming 'size' is < 'target_size'
                   if (is_narrower_load && size < target_size) {
                                           ^~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11065:3: note: Taking true branch
                   if (is_narrower_load && size < target_size) {
                   ^
   kernel/bpf/verifier.c:11068:8: note: Assuming 'shift' is 0
                           if (shift && cnt + 1 >=3D ARRAY_SIZE(insn_buf)) {
                               ^~~~~
   kernel/bpf/verifier.c:11068:14: note: Left side of '&&' is false
                           if (shift && cnt + 1 >=3D ARRAY_SIZE(insn_buf)) {
                                     ^
   kernel/bpf/verifier.c:11072:8: note: 'ctx_field_size' is > 4
                           if (ctx_field_size <=3D 4) {
                               ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11072:4: note: Taking false branch
                           if (ctx_field_size <=3D 4) {
                           ^
   kernel/bpf/verifier.c:11080:9: note: 'shift' is 0
                                   if (shift)
                                       ^~~~~
   kernel/bpf/verifier.c:11080:5: note: Taking false branch
                                   if (shift)
                                   ^
   kernel/bpf/verifier.c:11085:15: note: The result of the left shift is un=
defined due to shifting by '64', which is greater or equal to the width of =
type 'unsigned long long'
                                                                   (1ULL <<=
 size * 8) - 1);
                                                                         ^
   include/linux/filter.h:115:12: note: expanded from macro 'BPF_ALU64_IMM'
                   .imm   =3D IMM })
                            ^~~
   kernel/bpf/verifier.c:11163:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(func[i]->insnsi, &prog->insnsi[subprog_start],
                   ^~~~~~
   kernel/bpf/verifier.c:11163:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(func[i]->insnsi, &prog->insnsi[subprog_start],
                   ^~~~~~
   kernel/bpf/verifier.c:12480:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(env->prog->aux->used_maps, env->used_maps,
                   ^~~~~~
   kernel/bpf/verifier.c:12480:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(env->prog->aux->used_maps, env->used_maps,
                   ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (10 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/iio/industrialio-core.c:207:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", to_iio_const_attr(attr)->string);
                  ^~~~~~~
   drivers/iio/industrialio-core.c:207:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", to_iio_const_attr(attr)->string);
                  ^~~~~~~
   drivers/iio/industrialio-core.c:347:33: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           iio_dev_opaque->read_buf_len =3D snprintf(iio_dev_opaque->read_b=
uf,
                                          ^~~~~~~~
   drivers/iio/industrialio-core.c:347:33: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           iio_dev_opaque->read_buf_len =3D snprintf(iio_dev_opaque->read_b=
uf,
                                          ^~~~~~~~
   drivers/iio/industrialio-core.c:371:8: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%i %i", &reg, &val);
                 ^~~~~~
   drivers/iio/industrialio-core.c:371:8: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%i %i", &reg, &val);
                 ^~~~~~
   drivers/iio/industrialio-core.c:499:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", e->items[i]);
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:499:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", e->items[i]);
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:550:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s, %s, %s; %s, %s, %s; %s, %s,=
 %s\n",
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:550:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s, %s, %s; %s, %s, %s; %s, %s,=
 %s\n",
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:669:15: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return len + sprintf(buf + len, "\n");
                        ^~~~~~~
   drivers/iio/industrialio-core.c:669:15: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return len + sprintf(buf + len, "\n");
                        ^~~~~~~
   drivers/iio/industrialio-core.c:746:8: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(buf, PAGE_SIZE, "[");
                 ^~~~~~~~
   drivers/iio/industrialio-core.c:746:8: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(buf, PAGE_SIZE, "[");
                 ^~~~~~~~
   drivers/iio/industrialio-core.c:941:7: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(buf, "%c", &ch) !=3D 1)
                       ^~~~~~
   drivers/iio/industrialio-core.c:941:7: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(buf, "%c", &ch) !=3D 1)
                       ^~~~~~
   drivers/iio/industrialio-core.c:1324:9: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", indio_dev->name);
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:1324:9: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", indio_dev->name);
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:1334:9: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", indio_dev->label);
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:1334:9: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", indio_dev->label);
                  ^~~~~~~~
   drivers/iio/industrialio-core.c:1381:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, name, sz);
           ^~~~~~
   drivers/iio/industrialio-core.c:1381:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, name, sz);
           ^~~~~~
   drivers/iio/industrialio-core.c:1471:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iio_dev_opaque->chan_attr_group.attrs,
                   ^~~~~~
   drivers/iio/industrialio-core.c:1471:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(iio_dev_opaque->chan_attr_group.attrs,
                   ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/iio/proximity/as3935.c:53:8: warning: Excessive padding in 'stru=
ct as3935_state' (34 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   buf, =

   spi, =

   scan, =

   trig, =

   noise_tripped, =

   tune_cap, =

   nflwdth_reg, =

   lock, =

   work, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct as3935_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/proximity/as3935.c:53:8: note: Excessive padding in 'struct =
as3935_state' (34 padding bytes, where 2 is optimal). Optimal fields order:=
 buf, spi, scan, trig, noise_tripped, tune_cap, nflwdth_reg, lock, work, co=
nsider reordering the fields or adding explicit padding members
   struct as3935_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/proximity/as3935.c:125:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/iio/proximity/as3935.c:125:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/iio/proximity/as3935.c:156:8: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, "%d\n", !time_after(jiffies, st->noise_trip=
ped + HZ));
                 ^~~~~~~
--
           ^~~~~~
   lib/reed_solomon/test_rslib.c:173:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(r, c, len * sizeof(*r));
           ^~~~~~
   lib/reed_solomon/test_rslib.c:174:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(errlocs, 0, len * sizeof(*errlocs));
           ^~~~~~
   lib/reed_solomon/test_rslib.c:174:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(errlocs, 0, len * sizeof(*errlocs));
           ^~~~~~
   lib/reed_solomon/test_rslib.c:175:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(derrlocs, 0, nroots * sizeof(*derrlocs));
           ^~~~~~
   lib/reed_solomon/test_rslib.c:175:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(derrlocs, 0, nroots * sizeof(*derrlocs));
           ^~~~~~
   lib/reed_solomon/test_rslib.c:395:4: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(corr, 0, nroots * sizeof(*corr));
                           ^~~~~~
   lib/reed_solomon/test_rslib.c:395:4: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                           memset(corr, 0, nroots * sizeof(*corr));
                           ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/mmc/core/sd_ops.c:72:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&mrq, 0, sizeof(struct mmc_request));
                   ^~~~~~
   drivers/mmc/core/sd_ops.c:72:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(&mrq, 0, sizeof(struct mmc_request));
                   ^~~~~~
   drivers/mmc/core/sd_ops.c:74:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cmd->resp, 0, sizeof(cmd->resp));
                   ^~~~~~
   drivers/mmc/core/sd_ops.c:74:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(cmd->resp, 0, sizeof(cmd->resp));
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/mmc/core/sdio.c:30:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(vendor, "0x%04x\n", card->cis.vendor);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:30:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(vendor, "0x%04x\n", card->cis.vendor);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:31:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(device, "0x%04x\n", card->cis.device);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:31:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(device, "0x%04x\n", card->cis.device);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:32:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(revision, "%u.%u\n", card->major_rev, card->minor_rev);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:32:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(revision, "%u.%u\n", card->major_rev, card->minor_rev);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:33:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:33:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:34:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:34:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
>> drivers/mmc/core/sdio.c:49:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
   sdio_info_attr(1);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:49:1: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
   sdio_info_attr(1);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:50:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
   sdio_info_attr(2);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:50:1: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
   sdio_info_attr(2);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:51:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
   sdio_info_attr(3);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:51:1: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
   sdio_info_attr(3);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:52:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
   sdio_info_attr(4);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   drivers/mmc/core/sdio.c:52:1: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
   sdio_info_attr(4);
   ^
   drivers/mmc/core/sdio.c:45:9: note: expanded from macro 'sdio_info_attr'
           return sprintf(buf, "%s\n", card->info[num-1]);                 =
                        \
                  ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/dac/ad5686.c:60:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(st->pwr_down_mask &
                  ^~~~~~~
   drivers/iio/dac/ad5686.c:60:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(st->pwr_down_mask &
                  ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results =
in a dereference of a null pointer (loaded from variable 'prev') [clang-ana=
lyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null poi=
nter value
           const struct max9485_rate *curr, *prev =3D NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to=
 0
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Executio=
n continues on line 199
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in =
a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   fs/ext4/inline.c:183:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, (void *)(raw_inode->i_block), cp_len);
           ^~~~~~
   fs/ext4/inline.c:183:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(buffer, (void *)(raw_inode->i_block), cp_len);
           ^~~~~~
   fs/ext4/inline.c:197:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer,
           ^~~~~~
   fs/ext4/inline.c:197:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(buffer,
           ^~~~~~
   fs/ext4/inline.c:231:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((void *)raw_inode->i_block + pos, buffer, cp_len);
                   ^~~~~~
   fs/ext4/inline.c:231:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy((void *)raw_inode->i_block + pos, buffer, cp_len);
                   ^~~~~~
   fs/ext4/inline.c:246:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((void *)IFIRST(header) + le16_to_cpu(entry->e_value_offs)=
 + pos,
--
           ^~~~~~
   drivers/input/rmi4/rmi_f34v7.c:1379:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&f34->v7.phyaddr, 0x00, sizeof(f34->v7.phyaddr));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   kernel/bpf/ringbuf.c:457:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rec, data, size);
           ^~~~~~
   kernel/bpf/ringbuf.c:457:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(rec, data, size);
           ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   kernel/bpf/disasm.c:31:3: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, len, "%+d", insn->imm);
                   ^~~~~~~~
   kernel/bpf/disasm.c:31:3: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, len, "%+d", insn->imm);
                   ^~~~~~~~
   kernel/bpf/disasm.c:43:2: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buff, len, "0x%llx", (unsigned long long)full_imm);
           ^~~~~~~~
   kernel/bpf/disasm.c:43:2: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           snprintf(buff, len, "0x%llx", (unsigned long long)full_imm);
           ^~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   105 warnings generated.
   kernel/bpf/btf.c:750:3: warning: Value stored to 'id' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   id =3D t->type;
                   ^    ~~~~~~~
   kernel/bpf/btf.c:750:3: note: Value stored to 'id' is never read
                   id =3D t->type;
                   ^    ~~~~~~~
   kernel/bpf/btf.c:777:25: warning: Value stored to 't' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:777:25: note: Value stored to 't' during its initializa=
tion is never read
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:904:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(show->state.name, sizeof(show->state.name), "%s=
",
                   ^~~~~~~~
   kernel/bpf/btf.c:904:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(show->state.name, sizeof(show->state.name), "%s=
",
                   ^~~~~~~~
   kernel/bpf/btf.c:907:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(show->state.name, sizeof(show->state.name),
                   ^~~~~~~~
   kernel/bpf/btf.c:907:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(show->state.name, sizeof(show->state.name),
                   ^~~~~~~~
   kernel/bpf/btf.c:1421:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(new_types, btf->types,
                           ^~~~~~
   kernel/bpf/btf.c:1421:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(new_types, btf->types,
                           ^~~~~~
   kernel/bpf/btf.c:2067:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(print_num, data, nr_copy_bytes);
           ^~~~~~
   kernel/bpf/btf.c:2067:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(print_num, data, nr_copy_bytes);
           ^~~~~~
   kernel/bpf/btf.c:4079:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&btf->hdr, btf->data, hdr_copy);
           ^~~~~~
   kernel/bpf/btf.c:4079:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(&btf->hdr, btf->data, hdr_copy);
           ^~~~~~
   kernel/bpf/btf.c:5330:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&show->state, 0, sizeof(show->state));
           ^~~~~~
   kernel/bpf/btf.c:5330:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&show->state, 0, sizeof(show->state));
           ^~~~~~
   kernel/bpf/btf.c:5331:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&show->obj, 0, sizeof(show->obj));
           ^~~~~~
   kernel/bpf/btf.c:5331:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&show->obj, 0, sizeof(show->obj));
           ^~~~~~
   kernel/bpf/btf.c:5376:8: warning: Call to function 'vsnprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(show->target, ssnprintf->len_left, fmt, args);
                 ^~~~~~~~~
   kernel/bpf/btf.c:5376:8: note: Call to function 'vsnprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(show->target, ssnprintf->len_left, fmt, args);
                 ^~~~~~~~~
   kernel/bpf/btf.c:5507:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   kernel/bpf/btf.c:5507:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
   Suppressed 94 warnings (93 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/i2c/i2c-dev.c:104:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", i2c_dev->adap->name);
                  ^~~~~~~
   drivers/i2c/i2c-dev.c:104:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", i2c_dev->adap->name);
                  ^~~~~~~
   drivers/i2c/i2c-dev.c:608:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
           ^~~~~~~~
   drivers/i2c/i2c-dev.c:608:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
           ^~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/misc/tsl2550.c:180:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->power_state);
                  ^~~~~~~
   drivers/misc/tsl2550.c:180:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->power_state);
                  ^~~~~~~
   drivers/misc/tsl2550.c:212:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->operating_mode);
                  ^~~~~~~
   drivers/misc/tsl2550.c:212:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->operating_mode);
                  ^~~~~~~
   drivers/misc/tsl2550.c:265:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/misc/tsl2550.c:265:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/misc/hmc6352.c:84:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d.%d\n", ret/10, ret%10);
                  ^~~~~~~
   drivers/misc/hmc6352.c:84:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d.%d\n", ret/10, ret%10);
                  ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   crypto/des_generic.c:33:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dctx, 0, sizeof(*dctx));
                   ^~~~~~
   crypto/des_generic.c:33:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(dctx, 0, sizeof(*dctx));
                   ^~~~~~
   crypto/des_generic.c:65:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dctx, 0, sizeof(*dctx));
                   ^~~~~~
   crypto/des_generic.c:65:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(dctx, 0, sizeof(*dctx));
                   ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:504:9: warning: Access to field 'flags' re=
sults in a dereference of a null pointer (loaded from field 'msg') [clang-a=
nalyzer-core.NullDereference]
                   if (!(i2c->msg->flags & I2C_M_IGNORE_NAK))
                         ^
   drivers/i2c/busses/i2c-rk3x.c:1140:9: note: Calling 'rk3x_i2c_xfer_commo=
n'
           return rk3x_i2c_xfer_common(adap, msgs, num, true);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:1066:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&i2c->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:274:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:225:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:158:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/i2c/busses/i2c-rk3x.c:1066:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&i2c->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:274:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
--
                  ^~~~~~~
   drivers/nvme/host/core.c:3442:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%8ph\n", dev_to_ns_head(dev)->ids.eui64);
                  ^~~~~~~
   drivers/nvme/host/core.c:3449:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", dev_to_ns_head(dev)->ns_id);
                  ^~~~~~~
   drivers/nvme/host/core.c:3449:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", dev_to_ns_head(dev)->ns_id);
                  ^~~~~~~
   drivers/nvme/host/core.c:3519:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   nvme_show_str_function(model);
   ^
   drivers/nvme/host/core.c:3514:16: note: expanded from macro 'nvme_show_s=
tr_function'
           return sprintf(buf, "%.*s\n",                                   =
        \
                  ^~~~~~~
   drivers/nvme/host/core.c:3519:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   nvme_show_str_function(model);
   ^
   drivers/nvme/host/core.c:3514:16: note: expanded from macro 'nvme_show_s=
tr_function'
           return sprintf(buf, "%.*s\n",                                   =
        \
                  ^~~~~~~
   drivers/nvme/host/core.c:3520:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   nvme_show_str_function(serial);
   ^
   drivers/nvme/host/core.c:3514:16: note: expanded from macro 'nvme_show_s=
tr_function'
           return sprintf(buf, "%.*s\n",                                   =
        \
                  ^~~~~~~
   drivers/nvme/host/core.c:3520:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   nvme_show_str_function(serial);
   ^
   drivers/nvme/host/core.c:3514:16: note: expanded from macro 'nvme_show_s=
tr_function'
           return sprintf(buf, "%.*s\n",                                   =
        \
                  ^~~~~~~
   drivers/nvme/host/core.c:3521:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   nvme_show_str_function(firmware_rev);
   ^
   drivers/nvme/host/core.c:3514:16: note: expanded from macro 'nvme_show_s=
tr_function'
           return sprintf(buf, "%.*s\n",                                   =
        \
                  ^~~~~~~
   drivers/nvme/host/core.c:3521:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   nvme_show_str_function(firmware_rev);
   ^
   drivers/nvme/host/core.c:3514:16: note: expanded from macro 'nvme_show_s=
tr_function'
           return sprintf(buf, "%.*s\n",                                   =
        \
                  ^~~~~~~
   drivers/nvme/host/core.c:3532:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   nvme_show_int_function(cntlid);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3532:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   nvme_show_int_function(cntlid);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3533:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   nvme_show_int_function(numa_node);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3533:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   nvme_show_int_function(numa_node);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3534:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   nvme_show_int_function(queue_count);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3534:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   nvme_show_int_function(queue_count);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3535:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   nvme_show_int_function(sqsize);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3535:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   nvme_show_int_function(sqsize);
   ^
   drivers/nvme/host/core.c:3528:16: note: expanded from macro 'nvme_show_i=
nt_function'
           return sprintf(buf, "%d\n", ctrl->field);       \
                  ^~~~~~~
   drivers/nvme/host/core.c:3555:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", ctrl->ops->name);
                  ^~~~~~~~
   drivers/nvme/host/core.c:3555:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", ctrl->ops->name);
                  ^~~~~~~~
>> drivers/nvme/host/core.c:3576:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   return sprintf(buf, "%s\n", state_name[ctrl->state]);
                          ^~~~~~~
   drivers/nvme/host/core.c:3576:10: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   return sprintf(buf, "%s\n", state_name[ctrl->state]);
                          ^~~~~~~
   drivers/nvme/host/core.c:3578:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "unknown state\n");
                  ^~~~~~~
   drivers/nvme/host/core.c:3578:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "unknown state\n");
                  ^~~~~~~
   drivers/nvme/host/core.c:3589:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", ctrl->subsys->subnqn);
                  ^~~~~~~~
   drivers/nvme/host/core.c:3589:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", ctrl->subsys->subnqn);
                  ^~~~~~~~
   drivers/nvme/host/core.c:3599:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", ctrl->opts->host->nqn);
                  ^~~~~~~~
   drivers/nvme/host/core.c:3599:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", ctrl->opts->host->nqn);
                  ^~~~~~~~
   drivers/nvme/host/core.c:3609:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%pU\n", &ctrl->opts->host->id);
                  ^~~~~~~~
   drivers/nvme/host/core.c:3609:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%pU\n", &ctrl->opts->host->id);
                  ^~~~~~~~
   drivers/nvme/host/core.c:3630:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/nvme/host/core.c:3630:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/nvme/host/core.c:3631:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/nvme/host/core.c:3631:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/nvme/host/core.c:3662:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/nvme/host/core.c:3662:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/nvme/host/core.c:3663:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ctrl->opts->reconnect_delay);
                  ^~~~~~~
   drivers/nvme/host/core.c:3663:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ctrl->opts->reconnect_delay);
                  ^~~~~~~
   drivers/nvme/host/core.c:3952:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(disk->disk_name, disk_name, DISK_NAME_LEN);
           ^~~~~~
   drivers/nvme/host/core.c:3952:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(disk->disk_name, disk_name, DISK_NAME_LEN);
           ^~~~~~
   drivers/nvme/host/core.c:4558:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ctrl->ka_cmd, 0, sizeof(ctrl->ka_cmd));
           ^~~~~~
   drivers/nvme/host/core.c:4558:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&ctrl->ka_cmd, 0, sizeof(ctrl->ka_cmd));
           ^~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/input/mouse/elan_i2c_smbus.c:127:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(val, buf, ETP_CALIBRATE_MAX_LEN);
           ^~~~~~
   drivers/input/mouse/elan_i2c_smbus.c:127:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(val, buf, ETP_CALIBRATE_MAX_LEN);
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/input/mouse/vsxxxaa.c:119:3: warning: Call to function 'memmove'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(mouse->buf, mouse->buf + num, BUFLEN - num);
                   ^~~~~~~
   drivers/input/mouse/vsxxxaa.c:119:3: note: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11
                   memmove(mouse->buf, mouse->buf + num, BUFLEN - num);
                   ^~~~~~~
   drivers/input/mouse/vsxxxaa.c:151:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mouse->name, sizeof(mouse->name),
                   ^~~~~~~~
   drivers/input/mouse/vsxxxaa.c:151:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(mouse->name, sizeof(mouse->name),
                   ^~~~~~~~
   drivers/input/mouse/vsxxxaa.c:471:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->p=
hys);
           ^~~~~~~~
   drivers/input/mouse/vsxxxaa.c:471:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->p=
hys);
           ^~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   50 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_c.c:14:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:14:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:15:34: warning: Value stored to=
 'c' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:15:34: note: Value stored to 'c=
' during its initialization is never read
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:92:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:92:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:145:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:145:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:281:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:281:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:299:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:299:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/dac/ltc2632.c:138:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/iio/dac/ltc2632.c:138:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/media/i2c/cx25840/cx25840-ir.c:715:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p, &ir_state->rx_params,
           ^~~~~~
   drivers/media/i2c/cx25840/cx25840-ir.c:715:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(p, &ir_state->rx_params,
           ^~~~~~
   drivers/media/i2c/cx25840/cx25840-ir.c:905:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p, &ir_state->tx_params,
           ^~~~~~
   drivers/media/i2c/cx25840/cx25840-ir.c:905:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(p, &ir_state->tx_params,
           ^~~~~~
   Suppressed 48 warnings (44 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/iio/industrialio-event.c:298:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", val);
                          ^~~~~~~
   drivers/iio/industrialio-event.c:298:10: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", val);
                          ^~~~~~~
   drivers/iio/industrialio-event.c:520:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ev_int->group.attrs,
                   ^~~~~~
   drivers/iio/industrialio-event.c:520:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ev_int->group.attrs,
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/iio/industrialio-buffer.c:229:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", to_iio_dev_attr(attr)->c->scan_index=
);
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:229:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", to_iio_dev_attr(attr)->c->scan_index=
);
                  ^~~~~~~
>> drivers/iio/industrialio-buffer.c:247:10: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
                   return sprintf(buf, "%s:%c%d/%dX%d>>%u\n",
                          ^~~~~~~
   drivers/iio/industrialio-buffer.c:247:10: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
                   return sprintf(buf, "%s:%c%d/%dX%d>>%u\n",
                          ^~~~~~~
   drivers/iio/industrialio-buffer.c:255:11: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
                           return sprintf(buf, "%s:%c%d/%d>>%u\n",
                                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:255:11: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
                           return sprintf(buf, "%s:%c%d/%d>>%u\n",
                                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:275:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:275:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:420:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", buffer->scan_timestamp);
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:420:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", buffer->scan_timestamp);
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:509:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", buffer->length);
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:509:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", buffer->length);
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:552:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", iio_buffer_is_active(buffer));
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:552:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", iio_buffer_is_active(buffer));
                  ^~~~~~~
   drivers/iio/industrialio-buffer.c:710:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(config, 0, sizeof(*config));
           ^~~~~~
   drivers/iio/industrialio-buffer.c:710:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(config, 0, sizeof(*config));
           ^~~~~~
   drivers/iio/industrialio-buffer.c:723:2: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:656:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:854:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/iio/industrialio-buffer.c:1168:8: note: Calling 'strtobool'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:189:9: note: Value assigned to 'requested_state',=
 which participates in a condition later
           return kstrtobool(s, res);
                  ^~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1168:8: note: Returning from 'strtoboo=
l'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1169:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/industrialio-buffer.c:1169:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/industrialio-buffer.c:1177:6: note: Assuming 'inlist' is not=
 equal to 'requested_state'
           if (inlist =3D=3D requested_state)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1177:2: note: Taking false branch
           if (inlist =3D=3D requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1180:6: note: Assuming 'requested_stat=
e' is true
           if (requested_state)
               ^~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1180:2: note: Taking true branch
           if (requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1181:9: note: Calling '__iio_update_bu=
ffers'
                   ret =3D __iio_update_buffers(indio_dev, buffer, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1063:42: note: Left side of '&&' is fa=
lse
           struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(indi=
o_dev);
                                                   ^
   include/linux/iio/iio-opaque.h:34:2: note: expanded from macro 'to_iio_d=
ev_opaque'
           container_of(indio_dev, struct iio_dev_opaque, indio_dev)
           ^
   include/linux/kernel.h:855:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/iio/industrialio-buffer.c:1063:42: note: Taking false branch
           struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(indi=
o_dev);
                                                   ^
   include/linux/iio/iio-opaque.h:34:2: note: expanded from macro 'to_iio_d=
ev_opaque'
           container_of(indio_dev, struct iio_dev_opaque, indio_dev)
--
   fs/btrfs/check-integrity.c:1340:6: note: Left side of '&&' is true
   fs/btrfs/check-integrity.c:1340:27: note: 'did_alloc_block_link' is 1
           if (limit_nesting > 0 && did_alloc_block_link) {
                                    ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1340:2: note: Taking true branch
           if (limit_nesting > 0 && did_alloc_block_link) {
           ^
   fs/btrfs/check-integrity.c:1341:9: note: Calling 'btrfsic_read_block'
                   ret =3D btrfsic_read_block(state, next_block_ctx);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1589:2: note: Taking false branch
           BUG_ON(block_ctx->datav);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:1589:2: note: Loop condition is false.  Exiti=
ng loop
           BUG_ON(block_ctx->datav);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:1590:2: note: Taking false branch
           BUG_ON(block_ctx->pagev);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:1590:2: note: Loop condition is false.  Exiti=
ng loop
           BUG_ON(block_ctx->pagev);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:1591:2: note: Taking false branch
           BUG_ON(block_ctx->mem_to_free);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:1591:2: note: Loop condition is false.  Exiti=
ng loop
           BUG_ON(block_ctx->mem_to_free);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:1592:7: note: Assuming the condition is false
           if (!PAGE_ALIGNED(block_ctx->dev_bytenr)) {
                ^
   include/linux/mm.h:228:28: note: expanded from macro 'PAGE_ALIGNED'
   #define PAGE_ALIGNED(addr)      IS_ALIGNED((unsigned long)(addr), PAGE_S=
IZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/kernel.h:38:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:1592:2: note: Taking true branch
           if (!PAGE_ALIGNED(block_ctx->dev_bytenr)) {
           ^
   fs/btrfs/check-integrity.c:1595:3: note: Returning without writing to 'b=
lock_ctx->datav'
                   return -1;
                   ^
   fs/btrfs/check-integrity.c:1341:9: note: Returning from 'btrfsic_read_bl=
ock'
                   ret =3D btrfsic_read_block(state, next_block_ctx);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1342:7: note: 'ret' is >=3D field 'len'
                   if (ret < (int)next_block_ctx->len) {
                       ^~~
   fs/btrfs/check-integrity.c:1342:3: note: Taking false branch
                   if (ret < (int)next_block_ctx->len) {
                   ^
   fs/btrfs/check-integrity.c:1356:2: note: Returning zero, which participa=
tes in a condition later
           return 0;
           ^~~~~~~~
   fs/btrfs/check-integrity.c:1123:16: note: Returning from 'btrfsic_create=
_link_to_next_block'
                           sf->error =3D btrfsic_create_link_to_next_block(
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1136:12: note: Field 'error' is 0
                           if (sf->error)
                                   ^
   fs/btrfs/check-integrity.c:1136:4: note: Taking false branch
                           if (sf->error)
                           ^
   fs/btrfs/check-integrity.c:1139:8: note: NULL is not equal to field 'nex=
t_block'
                           if (NULL !=3D sf->next_block) {
                               ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   fs/btrfs/check-integrity.c:1139:4: note: Taking true branch
                           if (NULL !=3D sf->next_block) {
                           ^
   fs/btrfs/check-integrity.c:1142:9: note: Array access (via field 'datav'=
) results in a null pointer dereference
                                       sf->next_block_ctx.datav[0];
                                       ^                  ~~~~~
   fs/btrfs/check-integrity.c:1208:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, kaddr + pgoff, cur);
                   ^~~~~~
   fs/btrfs/check-integrity.c:1208:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, kaddr + pgoff, cur);
                   ^~~~~~
>> fs/btrfs/check-integrity.c:2475:15: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           indent_add =3D sprintf(buf, "%c-%llu(%s/%llu/%u)",
                        ^~~~~~~
   fs/btrfs/check-integrity.c:2475:15: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           indent_add =3D sprintf(buf, "%c-%llu(%s/%llu/%u)",
                        ^~~~~~~
   fs/btrfs/check-integrity.c:2502:17: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           indent_add =3D sprintf(buf, " %d*--> ", l->ref_c=
nt);
                                        ^~~~~~~
   fs/btrfs/check-integrity.c:2502:17: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                           indent_add =3D sprintf(buf, " %d*--> ", l->ref_c=
nt);
                                        ^~~~~~~
   fs/btrfs/check-integrity.c:2504:17: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           indent_add =3D sprintf(buf, " --> ");
                                        ^~~~~~~
   fs/btrfs/check-integrity.c:2504:17: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                           indent_add =3D sprintf(buf, " --> ");
                                        ^~~~~~~
   include/linux/unaligned/packed_struct.h:25:2: warning: Undefined or garb=
age value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ptr->x;
           ^
   fs/btrfs/check-integrity.c:2777:7: note: Assuming the condition is true
           if (!PAGE_ALIGNED(fs_info->nodesize)) {
                ^
   include/linux/mm.h:228:28: note: expanded from macro 'PAGE_ALIGNED'
   #define PAGE_ALIGNED(addr)      IS_ALIGNED((unsigned long)(addr), PAGE_S=
IZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/kernel.h:38:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:2777:2: note: Taking false branch
           if (!PAGE_ALIGNED(fs_info->nodesize)) {
           ^
   fs/btrfs/check-integrity.c:2782:7: note: Assuming the condition is true
           if (!PAGE_ALIGNED(fs_info->sectorsize)) {
                ^
   include/linux/mm.h:228:28: note: expanded from macro 'PAGE_ALIGNED'
   #define PAGE_ALIGNED(addr)      IS_ALIGNED((unsigned long)(addr), PAGE_S=
IZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/kernel.h:38:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:2782:2: note: Taking false branch
           if (!PAGE_ALIGNED(fs_info->sectorsize)) {
           ^
   fs/btrfs/check-integrity.c:2788:6: note: Assuming 'state' is non-null
           if (!state)
               ^~~~~~
   fs/btrfs/check-integrity.c:2788:2: note: Taking false branch
           if (!state)
           ^
   fs/btrfs/check-integrity.c:2791:6: note: Assuming 'btrfsic_is_initialize=
d' is not equal to 0
           if (!btrfsic_is_initialized) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:2791:2: note: Taking false branch
           if (!btrfsic_is_initialized) {
           ^
   fs/btrfs/check-integrity.c:2809:2: note: Left side of '&&' is false
           list_for_each_entry(device, dev_head, dev_list) {
           ^
   include/linux/list.h:654:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:855:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/check-integrity.c:2809:2: note: Taking false branch
           list_for_each_entry(device, dev_head, dev_list) {
           ^
   include/linux/list.h:654:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/check-integrity.c:2809:2: note: Loop condition is false.  Exiti=
ng loop
           list_for_each_entry(device, dev_head, dev_list) {
           ^
   include/linux/list.h:654:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
--
           ^
   fs/btrfs/disk-io.c:2076:3: note: Calling 'list_del'
                   list_del(&gang[0]->root_list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/hwmon/lm95234.c:215:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:215:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:229:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u", !!(data->status & mask));
                  ^~~~~~~
   drivers/hwmon/lm95234.c:229:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u", !!(data->status & mask));
                  ^~~~~~~
   drivers/hwmon/lm95234.c:242:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, data->sensor_type & mask ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm95234.c:242:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, data->sensor_type & mask ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm95234.c:286:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u", data->tcrit2[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:286:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u", data->tcrit2[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:325:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:325:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:335:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u", data->tcrit1[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:335:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u", data->tcrit1[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:374:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:374:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:415:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d", data->toffset[index] * 500);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:415:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d", data->toffset[index] * 500);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:453:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:453:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   lib/zlib_deflate/deftree.c:1056:5: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       memcpy(&s->pending_buf[s->pending], buf, len);
       ^~~~~~
   lib/zlib_deflate/deftree.c:1056:5: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
       memcpy(&s->pending_buf[s->pending], buf, len);
       ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/accessibility/speakup/speakup_soft.c:157:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:157:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(buf));
           ^~~~~~
>> drivers/accessibility/speakup/speakup_soft.c:163:14: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depr=
ecatedOrUnsafeBufferHandling]
                           cp =3D cp + sprintf(cp, var->u.n.synth_fmt,
                                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:163:14: note: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11
                           cp =3D cp + sprintf(cp, var->u.n.synth_fmt,
                                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:2: warning: Value store=
d to 'cp' is never read [clang-analyzer-deadcode.DeadStores]
           cp =3D cp + sprintf(cp, "\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:2: note: Value stored t=
o 'cp' is never read
           cp =3D cp + sprintf(cp, "\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:12: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           cp =3D cp + sprintf(cp, "\n");
                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:167:12: note: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11
           cp =3D cp + sprintf(cp, "\n");
                     ^~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:379:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&synth_device, 0, sizeof(synth_device));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:379:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&synth_device, 0, sizeof(synth_device));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:388:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&synthu_device, 0, sizeof(synthu_device));
           ^~~~~~
   drivers/accessibility/speakup/speakup_soft.c:388:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&synthu_device, 0, sizeof(synthu_device));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/test-drivers/vimc/vimc-sensor.c:211:3: warning: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(str, sizeof(str),
                   ^~~~~~~~
   drivers/media/test-drivers/vimc/vimc-sensor.c:211:3: note: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(str, sizeof(str),
                   ^~~~~~~~
   drivers/media/test-drivers/vimc/vimc-sensor.c:218:3: warning: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(str, sizeof(str), "sensor size: %dx%d",
                   ^~~~~~~~
   drivers/media/test-drivers/vimc/vimc-sensor.c:218:3: note: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(str, sizeof(str), "sensor size: %dx%d",
                   ^~~~~~~~
   drivers/media/test-drivers/vimc/vimc-sensor.c:228:3: warning: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
                   ^~~~~~~~
   drivers/media/test-drivers/vimc/vimc-sensor.c:228:3: note: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
                   ^~~~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/dvb-frontends/tda10048.c:268:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + 1, data, len);
           ^~~~~~
   drivers/media/dvb-frontends/tda10048.c:268:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + 1, data, len);
           ^~~~~~
   drivers/media/dvb-frontends/tda10048.c:493:3: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/media/dvb-frontends/tda10048.c:493:3: note: Value stored to 'ret=
' is never read
                   ret =3D 0;
                   ^     ~
   drivers/media/dvb-frontends/tda10048.c:1096:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->config, config, sizeof(*config));
           ^~~~~~
   drivers/media/dvb-frontends/tda10048.c:1096:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->config, config, sizeof(*config));
           ^~~~~~
   drivers/media/dvb-frontends/tda10048.c:1106:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &tda10048_ops,
           ^~~~~~
   drivers/media/dvb-frontends/tda10048.c:1106:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &tda10048_ops,
           ^~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/media/dvb-frontends/s5h1411.c:880:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &s5h1411_ops,
           ^~~~~~
   drivers/media/dvb-frontends/s5h1411.c:880:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &s5h1411_ops,
           ^~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   fs/fuse/inode.c:488:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&outarg, 0, sizeof(outarg));
           ^~~~~~
   fs/fuse/inode.c:488:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(&outarg, 0, sizeof(outarg));
--
           ^~~~~~
   fs/btrfs/sysfs.c:1621:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&qgroup->kobj, 0, sizeof(*kobj));
           ^~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/media/i2c/ir-kbd-i2c.c:861:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ir->phys, sizeof(ir->phys), "%s/%s", dev_name(&adap->de=
v),
           ^~~~~~~~
   drivers/media/i2c/ir-kbd-i2c.c:861:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ir->phys, sizeof(ir->phys), "%s/%s", dev_name(&adap->de=
v),
           ^~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:395:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, st->buffer, sizeof(data));
           ^~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:395:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, st->buffer, sizeof(data));
           ^~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:778:3: warning: Call t=
o function 'memset' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memset_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&buffer, 0, sizeof(buffer));
                   ^~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:778:3: note: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&buffer, 0, sizeof(buffer));
                   ^~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:779:3: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&buffer.accel, accel, sizeof(buffer.accel));
                   ^~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:779:3: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&buffer.accel, accel, sizeof(buffer.accel));
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:256:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(st->buffer, &raw_wm, sizeof(raw_wm));
           ^~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:256:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(st->buffer, &raw_wm, sizeof(raw_wm));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/tty/serial/max310x.c:1040:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rs485->padding, 0, sizeof(rs485->padding));
           ^~~~~~
   drivers/tty/serial/max310x.c:1040:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(rs485->padding, 0, sizeof(rs485->padding));
           ^~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/tty/serial/sccnxp.c:949:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&s->pdata, pdata, sizeof(struct sccnxp_pdata));
                   ^~~~~~
   drivers/tty/serial/sccnxp.c:949:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&s->pdata, pdata, sizeof(struct sccnxp_pdata));
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/hwmon/mcp3021.c:98:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", in_input);
                  ^~~~~~~
   drivers/hwmon/mcp3021.c:98:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", in_input);
                  ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gnss/sirf.c:191:17: warning: Value stored to 'dev' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gnss/sirf.c:191:17: note: Value stored to 'dev' during its initi=
alization is never read
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
>> drivers/counter/counter.c:55:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", e->items[index]);
                  ^~~~~~~
   drivers/counter/counter.c:55:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", e->items[index]);
                  ^~~~~~~
   drivers/counter/counter.c:94:10: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
                   len +=3D sprintf(buf + len, "%s\n", e->items[i]);
                          ^~~~~~~
   drivers/counter/counter.c:94:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
                   len +=3D sprintf(buf + len, "%s\n", e->items[i]);
                          ^~~~~~~
   drivers/counter/counter.c:118:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", e->items[index]);
                  ^~~~~~~
   drivers/counter/counter.c:118:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", e->items[index]);
                  ^~~~~~~
   drivers/counter/counter.c:157:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   len +=3D sprintf(buf + len, "%s\n", e->items[i]);
                          ^~~~~~~
   drivers/counter/counter.c:157:10: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   len +=3D sprintf(buf + len, "%s\n", e->items[i]);
                          ^~~~~~~
   drivers/counter/counter.c:180:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", e->items[index]);
                  ^~~~~~~
   drivers/counter/counter.c:180:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", e->items[index]);
                  ^~~~~~~
   drivers/counter/counter.c:217:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   len +=3D sprintf(buf + len, "%s\n", e->items[i]);
                          ^~~~~~~
   drivers/counter/counter.c:217:10: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   len +=3D sprintf(buf + len, "%s\n", e->items[i]);
                          ^~~~~~~
   drivers/counter/counter.c:311:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", counter_signal_value_str[val]);
                  ^~~~~~~
   drivers/counter/counter.c:311:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", counter_signal_value_str[val]);
                  ^~~~~~~
   drivers/counter/counter.c:324:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", comp->name);
                  ^~~~~~~
   drivers/counter/counter.c:324:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", comp->name);
                  ^~~~~~~
   drivers/counter/counter.c:563:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", counter_synapse_action_str[action]);
                  ^~~~~~~
   drivers/counter/counter.c:563:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", counter_synapse_action_str[action]);
                  ^~~~~~~
   drivers/counter/counter.c:615:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   len +=3D sprintf(buf + len, "%s\n",
                          ^~~~~~~
   drivers/counter/counter.c:615:10: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   len +=3D sprintf(buf + len, "%s\n",
                          ^~~~~~~
   drivers/counter/counter.c:722:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", val);
                  ^~~~~~~
   drivers/counter/counter.c:722:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", val);
                  ^~~~~~~
   drivers/counter/counter.c:776:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", counter_count_function_str[function]=
);
                  ^~~~~~~
   drivers/counter/counter.c:776:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", counter_count_function_str[function]=
);
                  ^~~~~~~
   drivers/counter/counter.c:900:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   len +=3D sprintf(buf + len, "%s\n",
                          ^~~~~~~
   drivers/counter/counter.c:900:10: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   len +=3D sprintf(buf + len, "%s\n",
                          ^~~~~~~
   drivers/counter/counter.c:1051:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%zu\n", comp->size);
                  ^~~~~~~
   drivers/counter/counter.c:1051:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%zu\n", comp->size);
                  ^~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/staging/iio/cdc/ad7746.c:91:8: warning: Excessive padding in 'st=
ruct ad7746_chip_info' (36 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   data, =

   client, =

   lock, =

   config, =

   cap_setup, =

   vt_setup, =

   capdac_set, =

   capdac, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7746_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/staging/iio/cdc/ad7746.c:91:8: note: Excessive padding in 'struc=
t ad7746_chip_info' (36 padding bytes, where 4 is optimal). Optimal fields =
order: data, client, lock, config, cap_setup, vt_setup, capdac_set, capdac,=
 consider reordering the fields or adding explicit padding members

vim +2190 block/genhd.c

77ea887e433ad8 Tejun Heo    2010-12-08  2172  =

77ea887e433ad8 Tejun Heo    2010-12-08  2173  /*
77ea887e433ad8 Tejun Heo    2010-12-08  2174   * A disk events enabled devi=
ce has the following sysfs nodes under
77ea887e433ad8 Tejun Heo    2010-12-08  2175   * its /sys/block/X/ director=
y.
77ea887e433ad8 Tejun Heo    2010-12-08  2176   *
77ea887e433ad8 Tejun Heo    2010-12-08  2177   * events		: list of all supp=
orted events
77ea887e433ad8 Tejun Heo    2010-12-08  2178   * events_async		: list of ev=
ents which can be detected w/o polling
673387a930059f Martin Wilck 2019-03-27  2179   *			  (always empty, only fo=
r backwards compatibility)
77ea887e433ad8 Tejun Heo    2010-12-08  2180   * events_poll_msecs	: pollin=
g interval, 0: disable, -1: system default
77ea887e433ad8 Tejun Heo    2010-12-08  2181   */
77ea887e433ad8 Tejun Heo    2010-12-08  2182  static ssize_t __disk_events_=
show(unsigned int events, char *buf)
77ea887e433ad8 Tejun Heo    2010-12-08  2183  {
77ea887e433ad8 Tejun Heo    2010-12-08  2184  	const char *delim =3D "";
77ea887e433ad8 Tejun Heo    2010-12-08  2185  	ssize_t pos =3D 0;
77ea887e433ad8 Tejun Heo    2010-12-08  2186  	int i;
77ea887e433ad8 Tejun Heo    2010-12-08  2187  =

77ea887e433ad8 Tejun Heo    2010-12-08  2188  	for (i =3D 0; i < ARRAY_SIZE=
(disk_events_strs); i++)
77ea887e433ad8 Tejun Heo    2010-12-08  2189  		if (events & (1 << i)) {
77ea887e433ad8 Tejun Heo    2010-12-08 @2190  			pos +=3D sprintf(buf + pos=
, "%s%s",
77ea887e433ad8 Tejun Heo    2010-12-08  2191  				       delim, disk_events=
_strs[i]);
77ea887e433ad8 Tejun Heo    2010-12-08  2192  			delim =3D " ";
77ea887e433ad8 Tejun Heo    2010-12-08  2193  		}
77ea887e433ad8 Tejun Heo    2010-12-08  2194  	if (pos)
77ea887e433ad8 Tejun Heo    2010-12-08  2195  		pos +=3D sprintf(buf + pos,=
 "\n");
77ea887e433ad8 Tejun Heo    2010-12-08  2196  	return pos;
77ea887e433ad8 Tejun Heo    2010-12-08  2197  }
77ea887e433ad8 Tejun Heo    2010-12-08  2198  =


:::::: The code@line 2190 was first introduced by commit
:::::: 77ea887e433ad8389d416826936c110fa7910f80 implement in-kernel gendisk=
 events handling

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <jaxboe@fusionio.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3578356047046954656==--

