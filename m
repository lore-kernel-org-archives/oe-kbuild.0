Content-Type: multipart/mixed; boundary="===============6784283284189035224=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 25/29] block/genhd.c:2190:11: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides bound...
Date: Sun, 29 May 2022 23:35:17 +0800
Message-ID: <202205292339.FqYKTHJZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6784283284189035224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   13491710253d86e7fa5deb854bd304b1dd06ab9e
commit: 56f22b8f6853d26be82709a978e89db6856af6b4 [25/29] BACKPORT: Kbuild: =
move to -std=3Dgnu11
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20529/202205292339.FqYKTHJZ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 56f22b8f6853d26be82709a978e89db6856af6b4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


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
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/gpio/gpiolib-cdev.c:213:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:213:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:539:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:539:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:663:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:663:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1243:4: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1243:4: note: Value stored to 'ret' is never=
 read
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1553:4: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1553:4: note: Value stored to 'ret' is never=
 read
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1596:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1596:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1638:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ge, 0, sizeof(ge));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1638:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&ge, 0, sizeof(ge));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1837:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
--
               ^
   fs/fscache/cookie.c:254:61: note: Assuming 'aux_data_len' is <=3D 255
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
                                                                      ^~~~~=
~~~~~~~~~~~~~
   fs/fscache/cookie.c:254:2: note: Taking false branch
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
           ^
   fs/fscache/cookie.c:256:6: note: Assuming 'aux_data' is null
           if (!aux_data || !aux_data_len) {
               ^~~~~~~~~
   fs/fscache/cookie.c:256:16: note: Left side of '||' is true
           if (!aux_data || !aux_data_len) {
                         ^
   fs/fscache/cookie.c:257:3: note: Null pointer value stored to 'aux_data'
                   aux_data =3D NULL;
                   ^~~~~~~~~~~~~~~
   fs/fscache/cookie.c:261:2: note: Loop condition is false.  Exiting loop
           fscache_stat(&fscache_n_acquires);
           ^
   fs/fscache/internal.h:299:28: note: expanded from macro 'fscache_stat'
   #define fscache_stat(stat) do {} while (0)
                              ^
   fs/fscache/cookie.c:264:6: note: Assuming 'parent' is non-null
           if (!parent) {
               ^~~~~~~
   fs/fscache/cookie.c:264:2: note: Taking false branch
           if (!parent) {
           ^
   fs/fscache/cookie.c:271:9: note: Assuming the condition is false
           BUG_ON(!def->name[0]);
                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/fscache/cookie.c:271:2: note: Taking false branch
           BUG_ON(!def->name[0]);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/fscache/cookie.c:271:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!def->name[0]);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/fscache/cookie.c:273:9: note: Assuming field 'type' is not equal to 0
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/fscache/cookie.c:273:48: note: Left side of '&&' is false
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
                                                         ^
   fs/fscache/cookie.c:273:2: note: Taking false branch
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/fscache/cookie.c:273:2: note: Loop condition is false.  Exiting loop
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/fscache/cookie.c:278:7: note: Passing null pointer value via 5th para=
meter 'aux_data'
                                            aux_data, aux_data_len,
                                            ^~~~~~~~
   fs/fscache/cookie.c:276:14: note: Calling 'fscache_alloc_cookie'
           candidate =3D fscache_alloc_cookie(parent, def,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/cookie.c:135:6: note: Assuming 'cookie' is non-null
           if (!cookie)
               ^~~~~~~
   fs/fscache/cookie.c:135:2: note: Taking false branch
           if (!cookie)
           ^
   fs/fscache/cookie.c:141:2: note: Taking false branch
           if (fscache_set_key(cookie, index_key, index_key_len) < 0)
           ^
   fs/fscache/cookie.c:144:6: note: Assuming the condition is true
           if (cookie->aux_len <=3D sizeof(cookie->inline_aux)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/cookie.c:144:2: note: Taking true branch
           if (cookie->aux_len <=3D sizeof(cookie->inline_aux)) {
           ^
   fs/fscache/cookie.c:145:3: note: Null pointer passed as 2nd argument to =
memory copy function
                   memcpy(cookie->inline_aux, aux_data, cookie->aux_len);
                   ^                          ~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
>> drivers/gpio/gpiolib-sysfs.c:69:11: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           status =3D sprintf(buf, "%s\n",
                    ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:69:11: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           status =3D sprintf(buf, "%s\n",
                    ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:253:13: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           status =3D sprintf(buf, "%s\n", trigger_types[i]=
.name);
                                    ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:253:13: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           status =3D sprintf(buf, "%s\n", trigger_types[i]=
.name);
                                    ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:339:11: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           status =3D sprintf(buf, "%d\n",
                    ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:339:11: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           status =3D sprintf(buf, "%d\n",
                    ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:418:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", chip->base);
                  ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:418:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", chip->base);
                  ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:427:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%s\n", chip->label ? : "");
                  ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:427:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%s\n", chip->label ? : "");
                  ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:436:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", chip->ngpio);
                  ^~~~~~~
   drivers/gpio/gpiolib-sysfs.c:436:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", chip->ngpio);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/regulator/virtual.c:111:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->min_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:111:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->min_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:137:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->max_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:137:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->max_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:163:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->min_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:163:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->min_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:189:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->max_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:189:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->max_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:218:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "fast\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:218:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "fast\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:220:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "normal\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:220:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "normal\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:222:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "idle\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:222:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "idle\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:224:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:224:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "standby\n");
--
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   fs/gfs2/main.c:45:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(&ip->i_res, 0, sizeof(ip->i_res));
           ^~~~~~
   fs/gfs2/main.c:45:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(&ip->i_res, 0, sizeof(ip->i_res));
           ^~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (56 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   fs/gfs2/aops.c:457:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
           ^~~~~~
   fs/gfs2/aops.c:457:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
           ^~~~~~
   fs/gfs2/aops.c:458:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
           ^~~~~~
   fs/gfs2/aops.c:458:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
           ^~~~~~
   fs/gfs2/aops.c:530:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + copied, p + offset, amt);
                   ^~~~~~
   fs/gfs2/aops.c:530:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(buf + copied, p + offset, amt);
                   ^~~~~~
   Suppressed 56 warnings (56 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   fs/exfat/namei.c:537:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->crtime, 0, sizeof(info->crtime));
           ^~~~~~
   fs/exfat/namei.c:537:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&info->crtime, 0, sizeof(info->crtime));
           ^~~~~~
   fs/exfat/namei.c:538:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->mtime, 0, sizeof(info->mtime));
           ^~~~~~
   fs/exfat/namei.c:538:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&info->mtime, 0, sizeof(info->mtime));
           ^~~~~~
   fs/exfat/namei.c:539:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->atime, 0, sizeof(info->atime));
           ^~~~~~
   fs/exfat/namei.c:539:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&info->atime, 0, sizeof(info->atime));
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/pcmcia/socket_sysfs.c:41:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "32-bit\n");
                          ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:41:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "32-bit\n");
                          ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:42:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "16-bit\n");
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:42:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "16-bit\n");
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:54:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d.%dV\n", s->socket.Vcc / 10,
                          ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:54:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d.%dV\n", s->socket.Vcc / 10,
                          ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:56:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "X.XV\n");
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:56:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "X.XV\n");
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:66:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d.%dV\n", s->socket.Vpp / 10, s->socket.Vp=
p % 10);
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:66:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d.%dV\n", s->socket.Vpp / 10, s->socket.Vp=
p % 10);
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:76:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d.%dV\n", s->socket.Vcc / 10, s->socket.Vc=
c % 10);
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:76:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d.%dV\n", s->socket.Vcc / 10, s->socket.Vc=
c % 10);
                  ^~~~~~~
>> drivers/pcmcia/socket_sysfs.c:101:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(buf, "%s\n", s->state & SOCKET_SUSPEND ? "off" : =
"on");
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:101:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(buf, "%s\n", s->state & SOCKET_SUSPEND ? "off" : =
"on");
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:148:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%04x\n", s->irq_mask);
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:148:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%04x\n", s->irq_mask);
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:162:8: warning: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "0x%x\n", &mask);
                 ^~~~~~
   drivers/pcmcia/socket_sysfs.c:162:8: note: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "0x%x\n", &mask);
                 ^~~~~~
   drivers/pcmcia/socket_sysfs.c:180:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(buf, "%s\n", s->resource_setup_done ? "yes" : "no=
");
                  ^~~~~~~
   drivers/pcmcia/socket_sysfs.c:180:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(buf, "%s\n", s->resource_setup_done ? "yes" : "no=
");
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/leds/trigger/ledtrig-heartbeat.c:99:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", heartbeat_data->invert);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-heartbeat.c:99:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", heartbeat_data->invert);
                  ^~~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/leds/trigger/ledtrig-cpu.c:54:7: warning: Value stored to 'is_ac=
tive' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           bool is_active =3D trig->is_active;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~
   drivers/leds/trigger/ledtrig-cpu.c:54:7: note: Value stored to 'is_activ=
e' during its initialization is never read
           bool is_active =3D trig->is_active;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~
   drivers/leds/trigger/ledtrig-cpu.c:155:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
                   ^~~~~~~~
   drivers/leds/trigger/ledtrig-cpu.c:155:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
                   ^~~~~~~~
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/video/fbdev/core/fbcvt.c:233:3: warning: Value stored to 'off' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   off +=3D scnprintf(buf + off, size - off,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:233:3: note: Value stored to 'off' is n=
ever read
                   off +=3D scnprintf(buf + off, size - off,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:252:4: warning: Value stored to 'off' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           off +=3D scnprintf(buf + off, size - off, "-R");
--
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/cpufreq.c:190:9: note: '?' condition is true
           return policy && cpumask_test_cpu(cpu, policy->cpus) ? policy : =
NULL;
                  ^
   drivers/cpufreq/cpufreq.c:190:2: note: Returning pointer, which particip=
ates in a condition later
           return policy && cpumask_test_cpu(cpu, policy->cpus) ? policy : =
NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/cpufreq/cpufreq.c:1583:11: note: Returning from 'cpufreq_cpu_get=
_raw'
           policy =3D cpufreq_cpu_get_raw(cpu);
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/cpufreq.c:1584:7: note: 'policy' is non-null
           if (!policy) {
                ^~~~~~
   drivers/cpufreq/cpufreq.c:1584:2: note: Taking false branch
           if (!policy) {
           ^
   drivers/cpufreq/cpufreq.c:1590:2: note: Taking true branch
           if (has_target())
           ^
   drivers/cpufreq/cpufreq.c:1595:2: note: Taking true branch
           if (policy_is_inactive(policy)) {
           ^
   drivers/cpufreq/cpufreq.c:1596:3: note: Taking true branch
                   if (has_target())
                   ^
   drivers/cpufreq/cpufreq.c:1597:4: note: Null pointer passed as 2nd argum=
ent to string copy function
                           strncpy(policy->last_governor, policy->governor-=
>name,
                           ^                              ~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/cpufreq/cpufreq.c:2447:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(policy, cpu_policy, sizeof(*policy));
           ^~~~~~
   drivers/cpufreq/cpufreq.c:2447:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(policy, cpu_policy, sizeof(*policy));
           ^~~~~~
   drivers/cpufreq/cpufreq.c:2477:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&new_data.cpuinfo, &policy->cpuinfo, sizeof(policy->cpuin=
fo));
           ^~~~~~
   drivers/cpufreq/cpufreq.c:2477:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(&new_data.cpuinfo, &policy->cpuinfo, sizeof(policy->cpuin=
fo));
           ^~~~~~
   drivers/cpufreq/cpufreq.c:2874:3: warning: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(default_governor, gov->name, CPUFREQ_NAME_LEN);
                   ^~~~~~~
   drivers/cpufreq/cpufreq.c:2874:3: note: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11
                   strncpy(default_governor, gov->name, CPUFREQ_NAME_LEN);
                   ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/pcmcia/ds.c:105:11: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           fields =3D sscanf(buf, "%hx %hx %hx %hhx %hhx %hhx %x %x %x %x",
                    ^~~~~~
   drivers/pcmcia/ds.c:105:11: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
           fields =3D sscanf(buf, "%hx %hx %hx %hhx %hhx %hhx %x %x %x %x",
                    ^~~~~~
   drivers/pcmcia/ds.c:121:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dynid->id.prod_id_hash, prod_id_hash, sizeof(__u32) * 4);
           ^~~~~~
   drivers/pcmcia/ds.c:121:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(dynid->id.prod_id_hash, prod_id_hash, sizeof(__u32) * 4);
           ^~~~~~
   drivers/pcmcia/ds.c:1018:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pcmcia_device_attr(func_id, has_func_id, "0x%02x\n");
   ^
   drivers/pcmcia/ds.c:1006:23: note: expanded from macro 'pcmcia_device_at=
tr'
           return p_dev->test ? sprintf(buf, format, p_dev->field) : -ENODE=
V; \
                                ^~~~~~~
   drivers/pcmcia/ds.c:1018:1: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
   pcmcia_device_attr(func_id, has_func_id, "0x%02x\n");
   ^
   drivers/pcmcia/ds.c:1006:23: note: expanded from macro 'pcmcia_device_at=
tr'
           return p_dev->test ? sprintf(buf, format, p_dev->field) : -ENODE=
V; \
                                ^~~~~~~
   drivers/pcmcia/ds.c:1019:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pcmcia_device_attr(manf_id, has_manf_id, "0x%04x\n");
   ^
   drivers/pcmcia/ds.c:1006:23: note: expanded from macro 'pcmcia_device_at=
tr'
           return p_dev->test ? sprintf(buf, format, p_dev->field) : -ENODE=
V; \
                                ^~~~~~~
   drivers/pcmcia/ds.c:1019:1: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
   pcmcia_device_attr(manf_id, has_manf_id, "0x%04x\n");
   ^
   drivers/pcmcia/ds.c:1006:23: note: expanded from macro 'pcmcia_device_at=
tr'
           return p_dev->test ? sprintf(buf, format, p_dev->field) : -ENODE=
V; \
                                ^~~~~~~
   drivers/pcmcia/ds.c:1020:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pcmcia_device_attr(card_id, has_card_id, "0x%04x\n");
   ^
   drivers/pcmcia/ds.c:1006:23: note: expanded from macro 'pcmcia_device_at=
tr'
           return p_dev->test ? sprintf(buf, format, p_dev->field) : -ENODE=
V; \
                                ^~~~~~~
   drivers/pcmcia/ds.c:1020:1: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
   pcmcia_device_attr(card_id, has_card_id, "0x%04x\n");
   ^
   drivers/pcmcia/ds.c:1006:23: note: expanded from macro 'pcmcia_device_at=
tr'
           return p_dev->test ? sprintf(buf, format, p_dev->field) : -ENODE=
V; \
                                ^~~~~~~
>> drivers/pcmcia/ds.c:1021:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   pcmcia_device_stringattr(prod_id1, prod_id[0]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1021:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   pcmcia_device_stringattr(prod_id1, prod_id[0]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1022:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   pcmcia_device_stringattr(prod_id2, prod_id[1]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1022:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   pcmcia_device_stringattr(prod_id2, prod_id[1]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1023:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   pcmcia_device_stringattr(prod_id3, prod_id[2]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1023:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   pcmcia_device_stringattr(prod_id3, prod_id[2]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1024:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   pcmcia_device_stringattr(prod_id4, prod_id[3]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1024:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   pcmcia_device_stringattr(prod_id4, prod_id[3]);
   ^
   drivers/pcmcia/ds.c:1014:24: note: expanded from macro 'pcmcia_device_st=
ringattr'
           return p_dev->field ? sprintf(buf, "%s\n", p_dev->field) : -ENOD=
EV; \
                                 ^~~~~~~
   drivers/pcmcia/ds.c:1030:25: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return p_dev->socket ? sprintf(buf, "0x%02x\n", p_dev->func) : -=
ENODEV;
                                  ^~~~~~~
   drivers/pcmcia/ds.c:1030:25: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return p_dev->socket ? sprintf(buf, "0x%02x\n", p_dev->func) : -=
ENODEV;
                                  ^~~~~~~
   drivers/pcmcia/ds.c:1042:10: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "%pr\n", p_dev->resource[i]);
                          ^~~~~~~
   drivers/pcmcia/ds.c:1042:10: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "%pr\n", p_dev->resource[i]);
                          ^~~~~~~
   drivers/pcmcia/ds.c:1053:10: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/pcmcia/ds.c:1053:10: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/pcmcia/ds.c:1055:10: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "on\n");
                          ^~~~~~~
   drivers/pcmcia/ds.c:1055:10: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "on\n");
                          ^~~~~~~
   drivers/pcmcia/ds.c:1089:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "pcmcia:m%04Xc%04Xf%02Xfn%02Xpfn%02X"
                  ^~~~~~~
   drivers/pcmcia/ds.c:1089:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "pcmcia:m%04Xc%04Xf%02Xfn%02Xpfn%02X"
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   arch/x86/events/intel/uncore.c:102:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buf, "%s", event->config);
                  ^~~~~~~
   arch/x86/events/intel/uncore.c:102:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buf, "%s", event->config);
                  ^~~~~~~
   arch/x86/events/intel/uncore.c:861:4: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                           sprintf(pmu->name, "uncore_%s", pmu->type->name);
                           ^~~~~~~
   arch/x86/events/intel/uncore.c:861:4: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                           sprintf(pmu->name, "uncore_%s", pmu->type->name);
                           ^~~~~~~
   arch/x86/events/intel/uncore.c:863:4: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(pmu->name, "uncore");
                           ^~~~~~~
   arch/x86/events/intel/uncore.c:863:4: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(pmu->name, "uncore");
                           ^~~~~~~
   arch/x86/events/intel/uncore.c:865:3: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                   sprintf(pmu->name, "uncore_%s_%d", pmu->type->name,
--
           ^~~~~~
   drivers/acpi/apei/erst.c:1046:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(rcd, 0, sizeof(*rcd));
           ^~~~~~
   drivers/acpi/apei/erst.c:1047:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rcd->hdr.signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
           ^~~~~~
   drivers/acpi/apei/erst.c:1047:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(rcd->hdr.signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
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
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
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
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
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
           ^
   net/sctp/sm_sideeffect.c:771:6: note: Assuming field 'dst' is null
           if (t->dst)
               ^~~~~~
   net/sctp/sm_sideeffect.c:771:2: note: Taking false branch
           if (t->dst)
           ^
   net/sctp/sm_sideeffect.c:781:6: note: Assuming field 'rto_pending' is no=
t equal to 0
           if (t->rto_pending =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~
   net/sctp/sm_sideeffect.c:781:2: note: Taking false branch
           if (t->rto_pending =3D=3D 0)
           ^
   net/sctp/sm_sideeffect.c:784:41: note: Access to field 'skb' results in =
a dereference of a null pointer (loaded from variable 'chunk')
           hbinfo =3D (struct sctp_sender_hb_info *)chunk->skb->data;
                                                  ^~~~~
   net/sctp/sm_sideeffect.c:962:9: warning: Access to field 'chunk_end' res=
ults in a dereference of a null pointer (loaded from variable 'chunk') [cla=
ng-analyzer-core.NullDereference]
           while (chunk->chunk_end > chunk->skb->data) {
                  ^
   net/sctp/sm_sideeffect.c:1268:21: note: 'chunk' initialized to a null po=
inter value
           struct sctp_chunk *chunk =3D NULL, *new_obj;
                              ^~~~~
   net/sctp/sm_sideeffect.c:1279:6: note: Assuming 'event_type' is equal to=
 SCTP_EVENT_T_TIMEOUT
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sctp/sm_sideeffect.c:1279:2: note: Taking false branch
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
           ^
   net/sctp/sm_sideeffect.c:1289:2: note: Loop condition is true.  Entering=
 loop body
           while (NULL !=3D (cmd =3D sctp_next_cmd(commands))) {
           ^
   net/sctp/sm_sideeffect.c:1290:3: note: Control jumps to 'case SCTP_CMD_P=
ROCESS_OPERR:'  at line 1721
                   switch (cmd->verb) {
                   ^
   net/sctp/sm_sideeffect.c:1722:43: note: Passing null pointer value via 3=
rd parameter 'chunk'
                           sctp_cmd_process_operr(commands, asoc, chunk);
                                                                  ^~~~~
   net/sctp/sm_sideeffect.c:1722:4: note: Calling 'sctp_cmd_process_operr'
                           sctp_cmd_process_operr(commands, asoc, chunk);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sctp/sm_sideeffect.c:962:9: note: Access to field 'chunk_end' result=
s in a dereference of a null pointer (loaded from variable 'chunk')
           while (chunk->chunk_end > chunk->skb->data) {
                  ^~~~~
   net/sctp/sm_sideeffect.c:1685:25: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
                           chunk->subh.sack_hdr =3D &sackh;
                           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   net/sctp/sm_sideeffect.c:1268:21: note: 'chunk' initialized to a null po=
inter value
           struct sctp_chunk *chunk =3D NULL, *new_obj;
                              ^~~~~
   net/sctp/sm_sideeffect.c:1279:6: note: Assuming 'event_type' is equal to=
 SCTP_EVENT_T_TIMEOUT
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sctp/sm_sideeffect.c:1279:2: note: Taking false branch
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
           ^
   net/sctp/sm_sideeffect.c:1289:2: note: Loop condition is true.  Entering=
 loop body
           while (NULL !=3D (cmd =3D sctp_next_cmd(commands))) {
           ^
   net/sctp/sm_sideeffect.c:1290:3: note: Control jumps to 'case SCTP_CMD_P=
ROCESS_CTSN:'  at line 1678
                   switch (cmd->verb) {
                   ^
   net/sctp/sm_sideeffect.c:1685:25: note: Dereference of null pointer
                           chunk->subh.sack_hdr =3D &sackh;
                           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   net/sctp/sm_sideeffect.c:1695:20: warning: Access to field 'pdiscard' re=
sults in a dereference of a null pointer (loaded from variable 'chunk') [cl=
ang-analyzer-core.NullDereference]
                           chunk->pdiscard =3D 1;
                           ~~~~~           ^
   net/sctp/sm_sideeffect.c:1268:21: note: 'chunk' initialized to a null po=
inter value
           struct sctp_chunk *chunk =3D NULL, *new_obj;
                              ^~~~~
   net/sctp/sm_sideeffect.c:1279:6: note: Assuming 'event_type' is equal to=
 SCTP_EVENT_T_TIMEOUT
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sctp/sm_sideeffect.c:1279:2: note: Taking false branch
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
           ^
   net/sctp/sm_sideeffect.c:1289:2: note: Loop condition is true.  Entering=
 loop body
           while (NULL !=3D (cmd =3D sctp_next_cmd(commands))) {
           ^
   net/sctp/sm_sideeffect.c:1290:3: note: Control jumps to 'case SCTP_CMD_D=
ISCARD_PACKET:'  at line 1690
                   switch (cmd->verb) {
                   ^
   net/sctp/sm_sideeffect.c:1695:20: note: Access to field 'pdiscard' resul=
ts in a dereference of a null pointer (loaded from variable 'chunk')
                           chunk->pdiscard =3D 1;
                           ~~~~~           ^
   Suppressed 110 warnings (110 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   mm/swap_state.c:196:9: warning: Value stored to 'entry' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
                   void *entry =3D xas_store(&xas, shadow);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c:196:9: note: Value stored to 'entry' during its initiali=
zation is never read
                   void *entry =3D xas_store(&xas, shadow);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swap_state.c:902:9: warning: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", enable_vma_readahead ? "true" : "fal=
se");
                  ^~~~~~~
   mm/swap_state.c:902:9: note: Call to function 'sprintf' is insecure as i=
t does not provide bounding of the memory buffer or security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", enable_vma_readahead ? "true" : "fal=
se");
                  ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   net/sched/sch_choke.c:321:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(q->tab, 0, (q->tab_mask + 1) * sizeof(struct sk_b=
uff *));
                   ^~~~~~
   net/sched/sch_choke.c:321:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(q->tab, 0, (q->tab_mask + 1) * sizeof(struct sk_b=
uff *));
                   ^~~~~~
   Suppressed 93 warnings (93 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   117 warnings generated.
   net/sched/cls_flow.c:89:2: warning: Undefined or garbage value returned =
to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return flow->basic.ip_proto;
           ^
   net/sched/cls_flow.c:298:27: note: Left side of '||' is false
           struct flow_head *head =3D rcu_dereference_bh(tp->root);
                                    ^
   include/linux/rcupdate.h:574:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:518:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:369:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/cls_flow.c:298:27: note: Left side of '||' is false
           struct flow_head *head =3D rcu_dereference_bh(tp->root);
                                    ^
   include/linux/rcupdate.h:574:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:518:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:369:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/cls_flow.c:298:27: note: Left side of '||' is false
           struct flow_head *head =3D rcu_dereference_bh(tp->root);
                                    ^
   include/linux/rcupdate.h:574:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:518:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:369:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/cls_flow.c:298:27: note: Left side of '||' is true
           struct flow_head *head =3D rcu_dereference_bh(tp->root);
                                    ^
   include/linux/rcupdate.h:574:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:518:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:369:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
--
                   ^~~~~~
   fs/cifs/smb2transport.c:134:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(key, chan->signkey, SMB3_SIGN_KEY_SIZE);
                           ^~~~~~
   fs/cifs/smb2transport.c:134:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                           memcpy(key, chan->signkey, SMB3_SIGN_KEY_SIZE);
                           ^~~~~~
   fs/cifs/smb2transport.c:234:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(smb2_signature, 0x0, SMB2_HMACSHA256_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:234:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(smb2_signature, 0x0, SMB2_HMACSHA256_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:235:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:235:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:288:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
                   ^~~~~~
   fs/cifs/smb2transport.c:288:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
                   ^~~~~~
   fs/cifs/smb2transport.c:308:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(prfhash, 0x0, SMB2_HMACSHA256_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:308:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(prfhash, 0x0, SMB2_HMACSHA256_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:309:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(key, 0x0, key_size);
           ^~~~~~
   fs/cifs/smb2transport.c:309:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(key, 0x0, key_size);
           ^~~~~~
   fs/cifs/smb2transport.c:378:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key, hashptr, key_size);
           ^~~~~~
   fs/cifs/smb2transport.c:378:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(key, hashptr, key_size);
           ^~~~~~
   fs/cifs/smb2transport.c:429:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ses->chans[0].signkey, ses->smb3signingkey,
                   ^~~~~~
   fs/cifs/smb2transport.c:429:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(ses->chans[0].signkey, ses->smb3signingkey,
                   ^~~~~~
   fs/cifs/smb2transport.c:432:3: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2transport.c:432:3: note: Value stored to 'rc' is never read
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2transport.c:562:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(smb3_signature, 0x0, SMB2_CMACAES_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:562:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(smb3_signature, 0x0, SMB2_CMACAES_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:563:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:563:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:604:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
                   ^~~~~~
   fs/cifs/smb2transport.c:604:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
                   ^~~~~~
   fs/cifs/smb2transport.c:634:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(shdr->Signature, "BSRSPYL", 8);
                   ^~~~~~~
   fs/cifs/smb2transport.c:634:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(shdr->Signature, "BSRSPYL", 8);
                   ^~~~~~~
   fs/cifs/smb2transport.c:672:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(server_response_sig, shdr->Signature, SMB2_SIGNATURE_SIZE=
);
           ^~~~~~
   fs/cifs/smb2transport.c:672:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(server_response_sig, shdr->Signature, SMB2_SIGNATURE_SIZE=
);
           ^~~~~~
   fs/cifs/smb2transport.c:674:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(shdr->Signature, 0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:674:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(shdr->Signature, 0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:718:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(temp, 0, sizeof(struct mid_q_entry));
           ^~~~~~
   fs/cifs/smb2transport.c:718:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(temp, 0, sizeof(struct mid_q_entry));
           ^~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
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
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   114 warnings generated.
   kernel/sched/core.c:3461:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&p->se.statistics, 0, sizeof(p->se.statistics));
           ^~~~~~
   kernel/sched/core.c:3461:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&p->se.statistics, 0, sizeof(p->se.statistics));
           ^~~~~~
   kernel/sched/core.c:3656:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&p->sched_info, 0, sizeof(p->sched_info));
                   ^~~~~~
   kernel/sched/core.c:3656:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&p->sched_info, 0, sizeof(p->sched_info));
                   ^~~~~~
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
   kernel/sched/core.c:4926:35: warning: Access to field 'core_cookie' resu=
lts in a dereference of a null pointer (loaded from variable 'max') [clang-=
analyzer-core.NullDereference]
           cookie =3D rq->core->core_cookie =3D max->core_cookie;
                                            ^
   kernel/sched/core.c:7146:2: note: Calling 'schedule'
           schedule();
           ^~~~~~~~~~
   kernel/sched/core.c:5472:3: note: Loop condition is false.  Exiting loop
                   preempt_disable();
                   ^
   include/linux/preempt.h:169:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   kernel/sched/core.c:5473:3: note: Calling '__schedule'
                   __schedule(false);
                   ^~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5286:8: note: Loop condition is false.  Exiting loop
           cpu =3D smp_processor_id();
                 ^
   include/linux/smp.h:244:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   arch/x86/include/asm/smp.h:159:30: note: expanded from macro '__smp_proc=
essor_id'
   #define __smp_processor_id() __this_cpu_read(cpu_number)
                                ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/core.c:5286:8: note: Control jumps to 'case 4:'  at line 52=
86
           cpu =3D smp_processor_id();
                 ^
   include/linux/smp.h:244:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   arch/x86/include/asm/smp.h:159:30: note: expanded from macro '__smp_proc=
essor_id'
   #define __smp_processor_id() __this_cpu_read(cpu_number)
                                ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   kernel/sched/core.c:5286:8: note:  Execution continues on line 5286
           cpu =3D smp_processor_id();
--
   25 warnings generated.
   crypto/michael_mic.c:68:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((u8 *)&mctx->pending + mctx->pending_len, data, f=
len);
                   ^~~~~~
   crypto/michael_mic.c:68:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy((u8 *)&mctx->pending + mctx->pending_len, data, f=
len);
                   ^~~~~~
   crypto/michael_mic.c:90:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&mctx->pending, data, len);
                   ^~~~~~
   crypto/michael_mic.c:90:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&mctx->pending, data, len);
                   ^~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   crypto/ansi_cprng.c:105:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(tmp, ctx->DT, DEFAULT_BLK_SZ);
                           ^~~~~~
   crypto/ansi_cprng.c:105:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(tmp, ctx->DT, DEFAULT_BLK_SZ);
                           ^~~~~~
   crypto/ansi_cprng.c:139:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ctx->last_rand_data, ctx->rand_data,
                           ^~~~~~
   crypto/ansi_cprng.c:139:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(ctx->last_rand_data, ctx->rand_data,
                           ^~~~~~
   crypto/ansi_cprng.c:218:4: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(buf, 0, nbytes);
                           ^~~~~~
   crypto/ansi_cprng.c:218:4: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                           memset(buf, 0, nbytes);
                           ^~~~~~
   crypto/ansi_cprng.c:245:5: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(buf, 0, nbytes);
                                   ^~~~~~
   crypto/ansi_cprng.c:245:5: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                                   memset(buf, 0, nbytes);
                                   ^~~~~~
   crypto/ansi_cprng.c:252:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ptr, ctx->rand_data, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:252:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(ptr, ctx->rand_data, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:291:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->V, V, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:291:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->V, V, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:293:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->V, DEFAULT_V_SEED, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:293:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->V, DEFAULT_V_SEED, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:296:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->DT, DT, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:296:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->DT, DT, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:298:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ctx->DT, 0, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:298:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(ctx->DT, 0, DEFAULT_BLK_SZ);
                   ^~~~~~
   crypto/ansi_cprng.c:300:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ctx->rand_data, 0, DEFAULT_BLK_SZ);
           ^~~~~~
   crypto/ansi_cprng.c:300:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(ctx->rand_data, 0, DEFAULT_BLK_SZ);
           ^~~~~~
   crypto/ansi_cprng.c:301:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ctx->last_rand_data, 0, DEFAULT_BLK_SZ);
           ^~~~~~
   crypto/ansi_cprng.c:301:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(ctx->last_rand_data, 0, DEFAULT_BLK_SZ);
           ^~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/gnss/core.c:358:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%s\n", gnss_type_name(gdev));
                  ^~~~~~~
   drivers/gnss/core.c:358:9: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%s\n", gnss_type_name(gdev));
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
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
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   net/phonet/socket.c:207:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sa, 0, sizeof(sa));
           ^~~~~~
   net/phonet/socket.c:207:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&sa, 0, sizeof(sa));
           ^~~~~~
   net/phonet/socket.c:321:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr, 0, sizeof(struct sockaddr_pn));
           ^~~~~~
   net/phonet/socket.c:321:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(addr, 0, sizeof(struct sockaddr_pn));
           ^~~~~~
   net/phonet/socket.c:479:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&try_sa, 0, sizeof(struct sockaddr_pn));
--
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:47:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pci_config_attr(device, "0x%04x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:47:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   pci_config_attr(device, "0x%04x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:48:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pci_config_attr(subsystem_vendor, "0x%04x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:48:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   pci_config_attr(subsystem_vendor, "0x%04x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:49:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pci_config_attr(subsystem_device, "0x%04x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:49:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   pci_config_attr(subsystem_device, "0x%04x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:50:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pci_config_attr(revision, "0x%02x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:50:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   pci_config_attr(revision, "0x%02x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:51:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pci_config_attr(class, "0x%06x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:51:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   pci_config_attr(class, "0x%06x\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:52:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pci_config_attr(irq, "%u\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:52:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   pci_config_attr(irq, "%u\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:53:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   pci_config_attr(untrusted, "%u\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:53:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   pci_config_attr(untrusted, "%u\n");
   ^
   drivers/pci/pci-sysfs.c:42:9: note: expanded from macro 'pci_config_attr'
           return sprintf(buf, format_string, pdev->field);                \
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:60:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", pdev->broken_parity_status);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:60:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", pdev->broken_parity_status);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:146:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "0x%016llx 0x%016llx 0x%016llx\n",
                          ^~~~~~~
   drivers/pci/pci-sysfs.c:146:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "0x%016llx 0x%016llx 0x%016llx\n",
                          ^~~~~~~
>> drivers/pci/pci-sysfs.c:160:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:160:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:170:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", pcie_get_width_cap(pdev));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:170:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", pcie_get_width_cap(pdev));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:188:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", pci_speed_string(speed));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:188:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", pci_speed_string(speed));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:203:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:203:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:220:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", sec_bus);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:220:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", sec_bus);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:236:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", sub_bus);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:236:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", sub_bus);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:246:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", pci_ari_enabled(pci_dev->bus));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:246:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", pci_ari_enabled(pci_dev->bus));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:255:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "pci:v%08Xd%08Xsv%08Xsd%08Xbc%02Xsc%02Xi%02X=
\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:255:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "pci:v%08Xd%08Xsv%08Xsd%08Xbc%02Xsc%02Xi%02X=
\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:297:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", atomic_read(&pdev->enable_cnt));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:297:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", atomic_read(&pdev->enable_cnt));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:343:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", fls64(pdev->dma_mask));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:343:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", fls64(pdev->dma_mask));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:351:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", fls64(dev->coherent_dma_mask));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:351:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", fls64(dev->coherent_dma_mask));
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:361:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", subordinate ?
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:361:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", subordinate ?
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:518:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", pdev->d3cold_allowed);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:518:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", pdev->d3cold_allowed);
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:653:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%u\n", (pdev =3D=3D vga_dev));
                          ^~~~~~~
   drivers/pci/pci-sysfs.c:653:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%u\n", (pdev =3D=3D vga_dev));
                          ^~~~~~~
   drivers/pci/pci-sysfs.c:655:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:655:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/pci/pci-sysfs.c:1147:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(res_attr_name, "resource%d_wc", num);
                   ^~~~~~~
   drivers/pci/pci-sysfs.c:1147:3: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   sprintf(res_attr_name, "resource%d_wc", num);
                   ^~~~~~~
   drivers/pci/pci-sysfs.c:1151:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(res_attr_name, "resource%d", num);
                   ^~~~~~~
   drivers/pci/pci-sysfs.c:1151:3: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   sprintf(res_attr_name, "resource%d", num);
--
           ^
   fs/io_uring.c:3568:12: note: Calling 'iov_iter_count'
           io_size =3D iov_iter_count(iter);
                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/uio.h:234:2: note: Undefined or garbage value returned to =
caller
           return i->count;
           ^      ~~~~~~~~
   Suppressed 91 warnings (90 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
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
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   fs/ocfs2/aops.c:103:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(kaddr + (bh_result->b_size * iblock),
                           ^~~~~~
   fs/ocfs2/aops.c:103:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(kaddr + (bh_result->b_size * iblock),
                           ^~~~~~
   fs/ocfs2/aops.c:247:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(kaddr, di->id2.i_data.id_data, size);
                   ^~~~~~
   fs/ocfs2/aops.c:247:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(kaddr, di->id2.i_data.id_data, size);
                   ^~~~~~
   fs/ocfs2/aops.c:249:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(kaddr + size, 0, PAGE_SIZE - size);
           ^~~~~~
   fs/ocfs2/aops.c:249:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(kaddr + size, 0, PAGE_SIZE - size);
           ^~~~~~
   fs/ocfs2/aops.c:557:4: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(kaddr + cluster_start, 0, from - cluster_=
start);
                           ^~~~~~
   fs/ocfs2/aops.c:557:4: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                           memset(kaddr + cluster_start, 0, from - cluster_=
start);
                           ^~~~~~
   fs/ocfs2/aops.c:559:4: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(kaddr + to, 0, cluster_end - to);
                           ^~~~~~
   fs/ocfs2/aops.c:559:4: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                           memset(kaddr + to, 0, cluster_end - to);
                           ^~~~~~
   fs/ocfs2/aops.c:561:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(kaddr + cluster_start, 0, cluster_end - cluster_s=
tart);
                   ^~~~~~
   fs/ocfs2/aops.c:561:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(kaddr + cluster_start, 0, cluster_end - cluster_s=
tart);
                   ^~~~~~
   fs/ocfs2/aops.c:983:4: warning: Value stored to 'map_from' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           map_from =3D cluster_start;
                           ^          ~~~~~~~~~~~~~
   fs/ocfs2/aops.c:983:4: note: Value stored to 'map_from' is never read
                           map_from =3D cluster_start;
                           ^          ~~~~~~~~~~~~~
   fs/ocfs2/aops.c:984:4: warning: Value stored to 'map_to' is never read [=
clang-analyzer-deadcode.DeadStores]
                           map_to =3D cluster_end;
                           ^        ~~~~~~~~~~~
   fs/ocfs2/aops.c:984:4: note: Value stored to 'map_to' is never read
                           map_to =3D cluster_end;
                           ^        ~~~~~~~~~~~
   fs/ocfs2/aops.c:994:3: warning: Value stored to 'map_from' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   map_from =3D cluster_start;
                   ^          ~~~~~~~~~~~~~
   fs/ocfs2/aops.c:994:3: note: Value stored to 'map_from' is never read
                   map_from =3D cluster_start;
                   ^          ~~~~~~~~~~~~~
   fs/ocfs2/aops.c:995:3: warning: Value stored to 'map_to' is never read [=
clang-analyzer-deadcode.DeadStores]
                   map_to =3D cluster_end;
                   ^        ~~~~~~~~~~~
   fs/ocfs2/aops.c:995:3: note: Value stored to 'map_to' is never read
                   map_to =3D cluster_end;
                   ^        ~~~~~~~~~~~
   fs/ocfs2/aops.c:1678:4: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/ocfs2/aops.c:1678:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/ocfs2/aops.c:1944:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(di->id2.i_data.id_data + pos, kaddr + pos, *copied);
           ^~~~~~
   fs/ocfs2/aops.c:1944:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(di->id2.i_data.id_data + pos, kaddr + pos, *copied);
           ^~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
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
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   fs/reiserfs/inode.c:403:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, inode->i_sb->s_blocksize);
           ^~~~~~
   fs/reiserfs/inode.c:403:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(p, 0, inode->i_sb->s_blocksize);
           ^~~~~~
   fs/reiserfs/inode.c:424:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p, ih_item_body(bh, ih) + path.pos_in_item, chars=
);
                   ^~~~~~
   fs/reiserfs/inode.c:424:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(p, ih_item_body(bh, ih) + path.pos_in_item, chars=
);
                   ^~~~~~
   fs/reiserfs/inode.c:1140:3: warning: Value stored to 'bh' is never read =
[clang-analyzer-deadcode.DeadStores]
                   bh =3D get_last_bh(&path);
                   ^
   fs/reiserfs/inode.c:1140:3: note: Value stored to 'bh' is never read
   fs/reiserfs/inode.c:1142:3: warning: Value stored to 'item' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   item =3D tp_item_body(&path);
                   ^      ~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:1142:3: note: Value stored to 'item' is never read
                   item =3D tp_item_body(&path);
                   ^      ~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:1520:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(INODE_PKEY(inode), 0, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/inode.c:1520:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(INODE_PKEY(inode), 0, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/inode.c:1964:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(INODE_PKEY(inode), &ih.ih_key, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/inode.c:1964:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(INODE_PKEY(inode), &ih.ih_key, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/inode.c:2456:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ih_item_body(bh, ih) + pos_in_item, p + bytes_cop=
ied,
                   ^~~~~~
   fs/reiserfs/inode.c:2456:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(ih_item_body(bh, ih) + pos_in_item, p + bytes_cop=
ied,
                   ^~~~~~
   fs/reiserfs/inode.c:3199:3: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ret =3D try_to_release_page(page, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:3199:3: note: Value stored to 'ret' is never read
                   ret =3D try_to_release_page(page, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1282:17: warning: The left operand of '&' is a ga=
rbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           v2->v =3D (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offse=
t);
                          ^
   fs/reiserfs/inode.c:1938:9: note: Assuming field 't_trans_id' is not equ=
al to 0
           BUG_ON(!th->t_trans_id);
                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/reiserfs/inode.c:1938:2: note: Taking false branch
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
--
   ^
   drivers/net/can/softing/softing_main.c:702:9: note: expanded from macro =
'DEV_ATTR_RO_STR'
           return sprintf(buf, "%s\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:709:1: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
   DEV_ATTR_RO_STR(hardware, pdat->name);
   ^
   drivers/net/can/softing/softing_main.c:702:9: note: expanded from macro =
'DEV_ATTR_RO_STR'
           return sprintf(buf, "%s\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:710:1: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEV_ATTR_RO(hardware_version, id.hw_version);
   ^
   drivers/net/can/softing/softing_main.c:693:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:710:1: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
   DEV_ATTR_RO(hardware_version, id.hw_version);
   ^
   drivers/net/can/softing/softing_main.c:693:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:711:1: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEV_ATTR_RO(license, id.license);
   ^
   drivers/net/can/softing/softing_main.c:693:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:711:1: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
   DEV_ATTR_RO(license, id.license);
   ^
   drivers/net/can/softing/softing_main.c:693:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/hwmon/adm1025.c:168:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in[index],
                  ^~~~~~~
   drivers/hwmon/adm1025.c:168:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in[index],
                  ^~~~~~~
   drivers/hwmon/adm1025.c:177:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[index],
                  ^~~~~~~
   drivers/hwmon/adm1025.c:177:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[index],
                  ^~~~~~~
   drivers/hwmon/adm1025.c:186:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[index],
                  ^~~~~~~
   drivers/hwmon/adm1025.c:186:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[index],
                  ^~~~~~~
   drivers/hwmon/adm1025.c:195:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[index]));
                  ^~~~~~~
   drivers/hwmon/adm1025.c:195:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[index]));
                  ^~~~~~~
   drivers/hwmon/adm1025.c:203:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[index])=
);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:203:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[index])=
);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:211:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[index])=
);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:211:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[index])=
);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:330:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:330:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:339:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:339:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:355:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/adm1025.c:355:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/adm1025.c:363:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/adm1025.c:363:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->vrm);
                  ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
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
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   fs/namespace.c:2235:13: warning: Access to field 'd_inode' results in a =
dereference of a null pointer (loaded from variable 'dentry') [clang-analyz=
er-core.NullDereference]
           inode_lock(dentry->d_inode);
                      ^
   fs/namespace.c:3715:1: note: Calling '__se_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:214:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:224:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:230:2: note: expanded from macro =
'__SYSCALL_DEFINEx'
           __X64_SYS_STUBx(x, name, __VA_ARGS__)                           \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:96:2: note: expanded from macro '=
__X64_SYS_STUBx'
           __SYS_STUBx(x64, sys##name,                                     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3715:1: note: Calling '__do_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:214:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:224:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:234:14: note: expanded from macro=
 '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3723:6: note: Assuming the condition is false
           if (!may_mount())
               ^~~~~~~~~~~~
   fs/namespace.c:3723:2: note: Taking false branch
           if (!may_mount())
           ^
   fs/namespace.c:3728:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3728:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3733:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3733:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3737:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3737:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3741:11: note: Calling 'lock_mount'
           old_mp =3D lock_mount(&old);
                    ^~~~~~~~~~~~~~~~
   fs/namespace.c:2236:6: note: Assuming the condition is true
           if (unlikely(cant_mount(dentry))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/namespace.c:2236:2: note: Taking false branch
           if (unlikely(cant_mount(dentry))) {
           ^
   fs/namespace.c:2242:14: note: 'mnt' is non-null
           if (likely(!mnt)) {
                       ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/namespace.c:2242:2: note: Taking false branch
           if (likely(!mnt)) {
           ^
   fs/namespace.c:2255:2: note: Null pointer value stored to 'dentry'
           dentry =3D path->dentry =3D dget(mnt->mnt_root);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:2256:2: note: Control jumps to line 2235
           goto retry;
           ^
   fs/namespace.c:2235:13: note: Access to field 'd_inode' results in a der=
eference of a null pointer (loaded from variable 'dentry')
           inode_lock(dentry->d_inode);
                      ^~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   drivers/net/phy/micrel.c:459:28: warning: Value stored to 'of_node' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:459:28: note: Value stored to 'of_node' during =
its initialization is never read
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:682:28: warning: Value stored to 'of_node' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:682:28: note: Value stored to 'of_node' during =
its initialization is never read
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:878:22: warning: Value stored to 'of_node' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *of_node =3D dev->of_node;
                               ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:878:22: note: Value stored to 'of_node' during =
its initialization is never read
           struct device_node *of_node =3D dev->of_node;
                               ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:942:2: warning: Value stored to 'regval' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:942:2: note: Value stored to 'regval' is never =
read
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/net/phy/microchip.c:40:3: warning: Value stored to 'rc' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   rc =3D phy_write(phydev, LAN88XX_INT_MASK, 0x7FFF);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:40:3: note: Value stored to 'rc' is never re=
ad
                   rc =3D phy_write(phydev, LAN88XX_INT_MASK, 0x7FFF);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:41:3: warning: Value stored to 'rc' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   rc =3D phy_read(phydev, LAN88XX_INT_STS);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:41:3: note: Value stored to 'rc' is never re=
ad
                   rc =3D phy_read(phydev, LAN88XX_INT_STS);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
>> drivers/hwmon/dell-smm-hwmon.c:660:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buf, "%s\n", labels[type]);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:660:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buf, "%s\n", labels[type]);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:673:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp * 1000);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:673:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp * 1000);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:704:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[t=
ype]);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:704:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[t=
ype]);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:716:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", fan_speed);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:716:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", fan_speed);
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:728:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", clamp_val(status * i8k_pwm_mult, 0, =
255));
                  ^~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:728:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", clamp_val(status * i8k_pwm_mult, 0, =
255));
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   fs/ext2/dir.c:449:2: warning: Value stored to 'err' is never read [clang=
-analyzer-deadcode.DeadStores]
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c:449:2: note: Value stored to 'err' is never read
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c:538:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(de->name, name, namelen);
           ^~~~~~
   fs/ext2/dir.c:538:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(de->name, name, namelen);
           ^~~~~~
   fs/ext2/dir.c:619:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(kaddr, 0, chunk_size);
           ^~~~~~
   fs/ext2/dir.c:619:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(kaddr, 0, chunk_size);
           ^~~~~~
   fs/ext2/dir.c:623:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy (de->name, ".\0\0", 4);
           ^~~~~~
   fs/ext2/dir.c:623:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy (de->name, ".\0\0", 4);
           ^~~~~~
   fs/ext2/dir.c:631:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy (de->name, "..\0", 4);
           ^~~~~~
   fs/ext2/dir.c:631:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy (de->name, "..\0", 4);
           ^~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   fs/reiserfs/bitmap.c:1198:14: warning: Value stored to 'start' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           b_blocknr_t start =3D hint->search_start;
                       ^~~~~   ~~~~~~~~~~~~~~~~~~
   fs/reiserfs/bitmap.c:1198:14: note: Value stored to 'start' during its i=
nitialization is never read
           b_blocknr_t start =3D hint->search_start;
                       ^~~~~   ~~~~~~~~~~~~~~~~~~
   fs/reiserfs/bitmap.c:1199:14: warning: Value stored to 'finish' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           b_blocknr_t finish =3D SB_BLOCK_COUNT(s) - 1;
                       ^~~~~~
   fs/reiserfs/bitmap.c:1199:14: note: Value stored to 'finish' during its =
initialization is never read
           b_blocknr_t finish =3D SB_BLOCK_COUNT(s) - 1;
                       ^~~~~~
   fs/reiserfs/bitmap.c:1463:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bitmap, 0xff, sizeof(*bitmap) * bmap_nr);
           ^~~~~~
   fs/reiserfs/bitmap.c:1463:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(bitmap, 0xff, sizeof(*bitmap) * bmap_nr);
           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   fs/orangefs/xattr.c:141:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buffer, cx->val, cx->length);
--
           ^
   fs/ext4/namei.c:4029:6: note: Assuming field 'bh' is non-null
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
               ^~~~~~~
   fs/ext4/namei.c:4029:6: note: Left side of '||' is false
   fs/ext4/namei.c:4029:17: note: Access to field 'inode' results in a dere=
ference of a null pointer (loaded from field 'de')
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
                          ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/input/touchscreen/wdt87xx_i2c.c:270:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &rx_buf[2], rx_len);
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:270:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &rx_buf[2], rx_len);
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:310:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &rx_buf[2], rx_len);
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:310:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &rx_buf[2], rx_len);
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:343:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tx_buf[tx_len], buf, buf_size);
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:343:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tx_buf[tx_len], buf, buf_size);
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:586:3: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&pkt_buf[CMD_DATA_OFFSET], data, packet_size);
                   ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:586:3: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&pkt_buf[CMD_DATA_OFFSET], data, packet_size);
                   ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:665:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cmd_buf, 0, sizeof(cmd_buf));
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:665:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(cmd_buf, 0, sizeof(cmd_buf));
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:674:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pkt_buf, 0, sizeof(pkt_buf));
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:674:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(pkt_buf, 0, sizeof(pkt_buf));
           ^~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:1088:2: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(wdt->phys, sizeof(wdt->phys), "i2c-%u-%04x/input0",
           ^~~~~~~~
   drivers/input/touchscreen/wdt87xx_i2c.c:1088:2: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(wdt->phys, sizeof(wdt->phys), "i2c-%u-%04x/input0",
           ^~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/regulator/bcm590xx-regulator.c:140:8: warning: Excessive padding=
 in 'struct bcm590xx_info' (14 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   name, =

   vin_name, =

   volt_table, =

   linear_ranges, =

   n_voltages, =

   n_linear_ranges, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/regulator/bcm590xx-regulator.c:140:8: note: Excessive padding in=
 'struct bcm590xx_info' (14 padding bytes, where 6 is optimal). Optimal fie=
lds order: name, vin_name, volt_table, linear_ranges, n_voltages, n_linear_=
ranges, consider reordering the fields or adding explicit padding members
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
>> drivers/regulator/bd9571mwv-regulator.c:172:9: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", bdreg->bkup_mode_enabled ? "on" : "o=
ff");
                  ^~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:172:9: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
           return sprintf(buf, "%s\n", bdreg->bkup_mode_enabled ? "on" : "o=
ff");
                  ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   net/ethtool/common.c:296:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(link_ksettings, 0, sizeof(*link_ksettings));
           ^~~~~~
   net/ethtool/common.c:296:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(link_ksettings, 0, sizeof(*link_ksettings));
           ^~~~~~
   net/ethtool/common.c:389:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^~~~~~
   net/ethtool/common.c:389:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   net/ethtool/netlink.c:304:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(reply_data, 0, ops->reply_data_size);
           ^~~~~~
   net/ethtool/netlink.c:304:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(reply_data, 0, ops->reply_data_size);
           ^~~~~~
   net/ethtool/netlink.c:594:2: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   net/ethtool/netlink.c:594:2: note: Value stored to 'ret' is never read
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   Suppressed 92 warnings (92 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   net/ethtool/bitset.c:17:17: warning: The result of the right shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'u32' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return ~(u32)0 >> (32 - n % 32);
                          ^
   net/ethtool/bitset.c:829:9: note: Calling 'ethnl_update_bitset32'
           return ethnl_update_bitset32((u32 *)bitmap, nbits, attr, names, =
extack,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/ethtool/bitset.c:561:6: note: Assuming 'attr' is non-null
           if (!attr)
               ^~~~~
   net/ethtool/bitset.c:561:2: note: Taking false branch
           if (!attr)
           ^
   net/ethtool/bitset.c:565:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/ethtool/bitset.c:565:2: note: Taking false branch
           if (ret < 0)
           ^
   net/ethtool/bitset.c:568:6: note: Assuming the condition is false
           if (tb[ETHTOOL_A_BITSET_BITS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/bitset.c:568:2: note: Taking false branch
           if (tb[ETHTOOL_A_BITSET_BITS])
           ^
   net/ethtool/bitset.c:572:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   net/ethtool/bitset.c:572:2: note: Taking false branch
           if (ret < 0)
           ^
   net/ethtool/bitset.c:576:16: note: Assuming '__UNIQUE_ID___x846' is >=3D=
 '__UNIQUE_ID___y847'
           change_bits =3D min_t(unsigned int,
                         ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   net/ethtool/bitset.c:576:16: note: '?' condition is false
           change_bits =3D min_t(unsigned int,
                         ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
--
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/misc/ics932s401.c:156:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/misc/ics932s401.c:156:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/misc/ics932s401.c:158:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/misc/ics932s401.c:158:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/misc/ics932s401.c:202:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", calculate_cpu_freq(data));
                  ^~~~~~~
   drivers/misc/ics932s401.c:202:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", calculate_cpu_freq(data));
                  ^~~~~~~
   drivers/misc/ics932s401.c:231:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/misc/ics932s401.c:231:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/misc/ics932s401.c:259:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", calculate_src_freq(data));
                  ^~~~~~~
   drivers/misc/ics932s401.c:259:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", calculate_src_freq(data));
                  ^~~~~~~
   drivers/misc/ics932s401.c:279:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/misc/ics932s401.c:279:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/misc/ics932s401.c:307:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", calculate_pci_freq(data));
                  ^~~~~~~
   drivers/misc/ics932s401.c:307:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", calculate_pci_freq(data));
                  ^~~~~~~
   drivers/misc/ics932s401.c:322:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/misc/ics932s401.c:322:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/misc/ics932s401.c:373:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/misc/ics932s401.c:373:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/misc/ics932s401.c:385:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0%%\n");
                          ^~~~~~~
   drivers/misc/ics932s401.c:385:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0%%\n");
                          ^~~~~~~
   drivers/misc/ics932s401.c:399:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "-0.%lu%%\n", val);
                  ^~~~~~~
   drivers/misc/ics932s401.c:399:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "-0.%lu%%\n", val);
                  ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/watchdog/ziirave_wdt.c:248:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(packet + 3, data, len);
           ^~~~~~
   drivers/watchdog/ziirave_wdt.c:248:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(packet + 3, data, len);
           ^~~~~~
   drivers/watchdog/ziirave_wdt.c:249:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(packet + 3 + len, 0, ZIIRAVE_FIRM_PKT_DATA_SIZE - len);
           ^~~~~~
   drivers/watchdog/ziirave_wdt.c:249:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(packet + 3 + len, 0, ZIIRAVE_FIRM_PKT_DATA_SIZE - len);
           ^~~~~~
   drivers/watchdog/ziirave_wdt.c:449:8: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_re=
v.major,
                 ^~~~~~~
   drivers/watchdog/ziirave_wdt.c:449:8: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           ret =3D sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_re=
v.major,
                 ^~~~~~~
   drivers/watchdog/ziirave_wdt.c:472:8: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_=
rev.major,
                 ^~~~~~~
   drivers/watchdog/ziirave_wdt.c:472:8: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           ret =3D sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_=
rev.major,
                 ^~~~~~~
>> drivers/watchdog/ziirave_wdt.c:495:8: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           ret =3D sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]=
);
                 ^~~~~~~
   drivers/watchdog/ziirave_wdt.c:495:8: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           ret =3D sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]=
);
                 ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/hwmon/menf21bmc_hwmon.c:104:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", input_names[attr->index]);
                  ^~~~~~~
   drivers/hwmon/menf21bmc_hwmon.c:104:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", input_names[attr->index]);
                  ^~~~~~~
   drivers/hwmon/menf21bmc_hwmon.c:116:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", drv_data->in_val[attr->index]);
                  ^~~~~~~
   drivers/hwmon/menf21bmc_hwmon.c:116:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", drv_data->in_val[attr->index]);
                  ^~~~~~~
   drivers/hwmon/menf21bmc_hwmon.c:125:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", drv_data->in_min[attr->index]);
                  ^~~~~~~
   drivers/hwmon/menf21bmc_hwmon.c:125:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", drv_data->in_min[attr->index]);
                  ^~~~~~~
   drivers/hwmon/menf21bmc_hwmon.c:134:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", drv_data->in_max[attr->index]);
                  ^~~~~~~
   drivers/hwmon/menf21bmc_hwmon.c:134:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", drv_data->in_max[attr->index]);
                  ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/hwmon/nct7802.c:77:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (mode >> (2 * sattr->index) & 3) + 2=
);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:77:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (mode >> (2 * sattr->index) & 3) + 2=
);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:110:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/nct7802.c:110:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/nct7802.c:116:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", !(regval & (1 << sattr->index)));
                  ^~~~~~~
   drivers/hwmon/nct7802.c:116:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", !(regval & (1 << sattr->index)));
                  ^~~~~~~
   drivers/hwmon/nct7802.c:128:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "255\n");
                          ^~~~~~~
   drivers/hwmon/nct7802.c:128:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "255\n");
                          ^~~~~~~
   drivers/hwmon/nct7802.c:134:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:134:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:165:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", enabled + 1);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:165:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", enabled + 1);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:352:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", voltage);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:352:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", voltage);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:427:8: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, "%u\n", !!(data->in_status & (1 << sattr->i=
ndex)));
                 ^~~~~~~
   drivers/hwmon/nct7802.c:427:8: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           ret =3D sprintf(buf, "%u\n", !!(data->in_status & (1 << sattr->i=
ndex)));
                 ^~~~~~~
   drivers/hwmon/nct7802.c:444:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:444:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:477:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:477:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:491:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/nct7802.c:491:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", speed);
--
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1054:3: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ath10k_sdio_mbox_proc_counter_intr(ar);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1054:3: note: Value stored to 're=
t' is never read
                   ret =3D ath10k_sdio_mbox_proc_counter_intr(ar);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1208:3: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ar_sdio->bmi_buf, req, req_len);
                   ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1208:3: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ar_sdio->bmi_buf, req, req_len);
                   ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1281:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(resp, ar_sdio->bmi_buf, *resp_len);
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1281:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(resp, ar_sdio->bmi_buf, *resp_len);
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1315:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bus_req, 0, sizeof(*bus_req));
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1315:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(bus_req, 0, sizeof(*bus_req));
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1559:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(regs, 0, sizeof(*regs));
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1559:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(regs, 0, sizeof(*regs));
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1753:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, mem, buf_len);
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1753:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, mem, buf_len);
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1930:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(regs, 0, sizeof(*regs)); /* disable all interrupts */
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1930:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(regs, 0, sizeof(*regs)); /* disable all interrupts */
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1931:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb->data, regs, sizeof(*regs));
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1931:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb->data, regs, sizeof(*regs));
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:2228:3: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + i, &val, 4);
                   ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:2228:3: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf + i, &val, 4);
                   ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:2445:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, buf_len);
           ^~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:2445:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, buf_len);
           ^~~~~~
   Suppressed 83 warnings (83 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/mmc/core/regulator.c:181:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   drivers/mmc/core/regulator.c:181:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/leds/trigger/ledtrig-timer.c:23:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_on);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-timer.c:23:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_on);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-timer.c:48:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_off);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-timer.c:48:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_off);
                  ^~~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/i2c/i2c-smbus.c:392:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&info, 0, sizeof(struct i2c_board_info));
                   ^~~~~~
   drivers/i2c/i2c-smbus.c:392:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&info, 0, sizeof(struct i2c_board_info));
                   ^~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
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
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/char/ipmi/ipmi_si_platform.c:160:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&io, 0, sizeof(io));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_platform.c:160:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&io, 0, sizeof(io));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_platform.c:334:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&io, 0, sizeof(io));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_platform.c:334:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&io, 0, sizeof(io));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/char/ipmi/ipmi_si_pci.c:78:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&io, 0, sizeof(io));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_pci.c:78:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&io, 0, sizeof(io));
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/hwmon/lm90.c:995:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
                  ^~~~~~~
   drivers/hwmon/lm90.c:995:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
                  ^~~~~~~
   drivers/hwmon/lm90.c:1071:41: warning: The result of the left shift is u=
ndefined because the left operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   data->temp11[index] =3D temp_to_s8(val) << 8;
                                                         ^
   drivers/hwmon/lm90.c:1432:2: note: Control jumps to 'case hwmon_temp:'  =
at line 1435
           switch (type) {
           ^
   drivers/hwmon/lm90.c:1436:10: note: Calling 'lm90_temp_write'
                   return lm90_temp_write(dev, attr, channel, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm90.c:1280:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/hwmon/lm90.c:1280:2: note: Taking false branch
           if (err)
           ^
   drivers/hwmon/lm90.c:1283:2: note: Control jumps to 'case hwmon_temp_off=
set:' @line 1313
           switch (attr) {
           ^
   drivers/hwmon/lm90.c:1314:9: note: Calling 'lm90_set_temp11'
                   err =3D lm90_set_temp11(data, REMOTE_OFFSET, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm90.c:1061:6: note: Assuming field 'kind' is not equal to=
 lm99
           if (data->kind =3D=3D lm99 && index <=3D 2)
               ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm90.c:1061:25: note: Left side of '&&' is false
           if (data->kind =3D=3D lm99 && index <=3D 2)
                                  ^
   drivers/hwmon/lm90.c:1064:6: note: Assuming the condition is false
           if (data->flags & LM90_HAVE_EXTENDED_TEMP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm90.c:1064:2: note: Taking false branch
           if (data->flags & LM90_HAVE_EXTENDED_TEMP)
           ^
   drivers/hwmon/lm90.c:1066:11: note: Assuming field 'kind' is not equal t=
o max6646
           else if (data->kind =3D=3D max6646)
                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm90.c:1066:7: note: Taking false branch
           else if (data->kind =3D=3D max6646)
                ^
   drivers/hwmon/lm90.c:1068:11: note: Assuming the condition is false
           else if (data->flags & LM90_HAVE_REM_LIMIT_EXT)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm90.c:1068:7: note: Taking false branch
           else if (data->flags & LM90_HAVE_REM_LIMIT_EXT)
                ^
   drivers/hwmon/lm90.c:1071:25: note: Calling 'temp_to_s8'
                   data->temp11[index] =3D temp_to_s8(val) << 8;
                                         ^~~~~~~~~~~~~~~
   drivers/hwmon/lm90.c:897:6: note: Assuming the condition is true
           if (val <=3D -128000)
--
                   ^~~~~~
   net/netfilter/nf_conntrack_core.c:2147:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_tuple, src_tuple, sizeof(*dst_tuple));
                   ^~~~~~
   net/netfilter/nf_conntrack_core.c:2147:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst_tuple, src_tuple, sizeof(*dst_tuple));
                   ^~~~~~
   net/netfilter/nf_conntrack_core.c:2164:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_tuple, src_tuple, sizeof(*dst_tuple));
           ^~~~~~
   net/netfilter/nf_conntrack_core.c:2164:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst_tuple, src_tuple, sizeof(*dst_tuple));
           ^~~~~~
   net/netfilter/nf_conntrack_core.c:2495:2: warning: Value stored to 'old_=
size' is never read [clang-analyzer-deadcode.DeadStores]
           old_size =3D nf_conntrack_htable_size;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_conntrack_core.c:2495:2: note: Value stored to 'old_siz=
e' is never read
           old_size =3D nf_conntrack_htable_size;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 113 warnings (113 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/hwmon/pmbus/inspur-ipsps.c:73:9: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", data);
                  ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:73:9: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", data);
                  ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:94:9: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
                  ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:94:9: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
                  ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:114:10: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
                          ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:114:10: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
                          ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:118:10: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
                          ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:118:10: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
                          ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:122:10: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
                          ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:122:10: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
                          ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:126:10: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "unspecified\n");
                          ^~~~~~~~
   drivers/hwmon/pmbus/inspur-ipsps.c:126:10: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "unspecified\n");
                          ^~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   drivers/net/can/dev/dev.c:987:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&bt, nla_data(data[IFLA_CAN_BITTIMING]), sizeof(b=
t));
                   ^~~~~~
   drivers/net/can/dev/dev.c:987:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&bt, nla_data(data[IFLA_CAN_BITTIMING]), sizeof(b=
t));
                   ^~~~~~
   drivers/net/can/dev/dev.c:1001:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&priv->bittiming, &bt, sizeof(bt));
                   ^~~~~~
   drivers/net/can/dev/dev.c:1001:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&priv->bittiming, &bt, sizeof(bt));
                   ^~~~~~
   drivers/net/can/dev/dev.c:1077:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dbt, nla_data(data[IFLA_CAN_DATA_BITTIMING]),
                   ^~~~~~
   drivers/net/can/dev/dev.c:1077:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&dbt, nla_data(data[IFLA_CAN_DATA_BITTIMING]),
                   ^~~~~~
   drivers/net/can/dev/dev.c:1092:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&priv->data_bittiming, &dbt, sizeof(dbt));
                   ^~~~~~
   drivers/net/can/dev/dev.c:1092:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&priv->data_bittiming, &dbt, sizeof(dbt));
                   ^~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/hwmon/powr1220.c:181:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", adc_val);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:181:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", adc_val);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:191:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->adc_maxes[attr->index]);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:191:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->adc_maxes[attr->index]);
                  ^~~~~~~
>> drivers/hwmon/powr1220.c:201:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", input_names[attr->index]);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:201:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", input_names[attr->index]);
                  ^~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   fs/xfs/xfs_trans_buf.c:575:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(bip->bli_formats[i].blf_data_map, 0,
                   ^~~~~~
   fs/xfs/xfs_trans_buf.c:575:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(bip->bli_formats[i].blf_data_map, 0,
                   ^~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   fs/xfs/xfs_dquot.c:220:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(d, 0, BBTOB(q->qi_dqchunklen));
           ^~~~~~
   fs/xfs/xfs_dquot.c:220:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(d, 0, BBTOB(q->qi_dqchunklen));
           ^~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/mfd/retu-mfd.c:214:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&reg, data, sizeof(reg));
           ^~~~~~
   drivers/mfd/retu-mfd.c:214:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&reg, data, sizeof(reg));
           ^~~~~~
   drivers/mfd/retu-mfd.c:215:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&val, data + sizeof(reg), sizeof(val));
           ^~~~~~
   drivers/mfd/retu-mfd.c:215:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&val, data + sizeof(reg), sizeof(val));
           ^~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/mfd/sky81452.c:47:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cells, 0, sizeof(cells));
           ^~~~~~
   drivers/mfd/sky81452.c:47:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(cells, 0, sizeof(cells));
           ^~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/nvdimm/btt.c:226:2: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dirname, 32, "arena%d", idx);
           ^~~~~~~~
   drivers/nvdimm/btt.c:226:2: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           snprintf(dirname, 32, "arena%d", idx);
           ^~~~~~~~
   drivers/nvdimm/btt.c:351:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ent, &log.ent[arena->log_index[ret_ent]], LOG_ENT=
_SIZE);
                   ^~~~~~
   drivers/nvdimm/btt.c:351:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(ent, &log.ent[arena->log_index[ret_ent]], LOG_ENT=
_SIZE);
                   ^~~~~~
   drivers/nvdimm/btt.c:497:2: warning: Undefined or garbage value returned=
 to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/nvdimm/btt.c:1676:6: note: Assuming field 'uuid' is non-null
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
               ^~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1676:6: note: Left side of '||' is false
   drivers/nvdimm/btt.c:1676:23: note: Assuming field 'ndns' is non-null
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
                                ^~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1676:6: note: Left side of '||' is false
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
               ^
   drivers/nvdimm/btt.c:1676:40: note: Assuming field 'lbasize' is not equa=
l to 0
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
                                                 ^~~~~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1676:2: note: Taking false branch
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
           ^
   drivers/nvdimm/btt.c:1682:6: note: Assuming 'btt_sb' is non-null
           if (!btt_sb)
               ^~~~~~~
   drivers/nvdimm/btt.c:1682:2: note: Taking false branch
--
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:504:2: note: Value assigned to fi=
eld 'blcmd_timer_expired', which participates in a condition later
           add_timer(&adapter->bl_cmd_timer);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:847:2: note: Returning from 'bl_s=
tart_cmd_timer'
           bl_start_cmd_timer(adapter, BL_CMD_TIMEOUT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:849:9: note: Assuming field 'blcm=
d_timer_expired' is false
           while (!adapter->blcmd_timer_expired) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:849:2: note: Loop condition is tr=
ue.  Entering loop body
           while (!adapter->blcmd_timer_expired) {
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:853:7: note: Assuming 'status' is=
 >=3D 0
                   if (status < 0) {
                       ^~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:853:3: note: Taking false branch
                   if (status < 0) {
                   ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:859:3: note: Left side of '&&' is=
 true
                   mdelay(1);
                   ^
   include/linux/delay.h:44:3: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
            ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:859:3: note: 1 is <=3D 5
                   mdelay(1);
                   ^
   include/linux/delay.h:44:30: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
                                       ^~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:859:3: note: '?' condition is true
                   mdelay(1);
                   ^
   include/linux/delay.h:44:2: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:859:3: note: Taking true branch
                   mdelay(1);
                   ^
   include/linux/delay.h:44:52: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
                                                             ^
   include/asm-generic/delay.h:22:3: note: expanded from macro 'udelay'
                   if (__builtin_constant_p(n)) {                          \
                   ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:859:3: note: Taking false branch
                   mdelay(1);
                   ^
   include/linux/delay.h:44:52: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
                                                             ^
   include/asm-generic/delay.h:23:4: note: expanded from macro 'udelay'
                           if ((n) / 20000 >=3D 1)                         =
  \
                           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:860:7: note: Assuming the conditi=
on is true
                   if ((regout_val >> 8) =3D=3D REGOUT_VALID)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:860:3: note: Taking true branch
                   if ((regout_val >> 8) =3D=3D REGOUT_VALID)
                   ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:861:4: note:  Execution continues=
 on line 863
                           break;
                           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:863:6: note: Assuming field 'blcm=
d_timer_expired' is false
           if (adapter->blcmd_timer_expired) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:863:2: note: Taking false branch
           if (adapter->blcmd_timer_expired) {
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:876:25: note: The result of the l=
eft shift is undefined because the left operand is negative
                                               REGOUT_INVALID << 8),
                                                              ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:1064:3: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&bootload_ds, fw_p, sizeof(struct bootload_ds));
                   ^~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:1064:3: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&bootload_ds, fw_p, sizeof(struct bootload_ds));
                   ^~~~~~
   Suppressed 96 warnings (96 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/hwmon/adt7x10.c:235:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ADT7X10_REG_TO_TEMP(data,
                  ^~~~~~~
   drivers/hwmon/adt7x10.c:235:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ADT7X10_REG_TO_TEMP(data,
                  ^~~~~~~
   drivers/hwmon/adt7x10.c:278:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/adt7x10.c:278:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/adt7x10.c:315:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(ret & attr->index));
                  ^~~~~~~
   drivers/hwmon/adt7x10.c:315:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(ret & attr->index));
                  ^~~~~~~
>> drivers/hwmon/adt7x10.c:323:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   drivers/hwmon/adt7x10.c:323:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/hwmon/it87.c:863:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", in_from_reg(data, nr, data->in[nr][i=
ndex]));
                  ^~~~~~~
   drivers/hwmon/it87.c:863:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", in_from_reg(data, nr, data->in[nr][i=
ndex]));
                  ^~~~~~~
   drivers/hwmon/it87.c:951:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index])=
);
                  ^~~~~~~
   drivers/hwmon/it87.c:951:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index])=
);
                  ^~~~~~~
   drivers/hwmon/it87.c:1030:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "6\n");  /* Intel PECI */
                          ^~~~~~~
   drivers/hwmon/it87.c:1030:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "6\n");  /* Intel PECI */
                          ^~~~~~~
   drivers/hwmon/it87.c:1032:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "3\n");  /* thermal diode */
                          ^~~~~~~
   drivers/hwmon/it87.c:1032:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "3\n");  /* thermal diode */
                          ^~~~~~~
   drivers/hwmon/it87.c:1034:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "4\n");  /* thermistor */
                          ^~~~~~~
   drivers/hwmon/it87.c:1034:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "4\n");  /* thermistor */
                          ^~~~~~~
   drivers/hwmon/it87.c:1035:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0\n");      /* disabled */
                  ^~~~~~~
   drivers/hwmon/it87.c:1035:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0\n");      /* disabled */
                  ^~~~~~~
   drivers/hwmon/it87.c:1122:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/it87.c:1122:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/it87.c:1132:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", DIV_FROM_REG(data->fan_div[nr]));
                  ^~~~~~~
   drivers/hwmon/it87.c:1132:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", DIV_FROM_REG(data->fan_div[nr]));
                  ^~~~~~~
   drivers/hwmon/it87.c:1142:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", pwm_mode(data, nr));
                  ^~~~~~~
   drivers/hwmon/it87.c:1142:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", pwm_mode(data, nr));
                  ^~~~~~~
   drivers/hwmon/it87.c:1152:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/it87.c:1152:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/it87.c:1172:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", freq);
                  ^~~~~~~
   drivers/hwmon/it87.c:1172:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", freq);
                  ^~~~~~~
   drivers/hwmon/it87.c:1458:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)BIT(map));
                  ^~~~~~~
   drivers/hwmon/it87.c:1458:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)BIT(map));
                  ^~~~~~~
   drivers/hwmon/it87.c:1516:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/it87.c:1516:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/it87.c:1552:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->auto_pwm[nr][1] & 0x7f);
                  ^~~~~~~
   drivers/hwmon/it87.c:1552:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->auto_pwm[nr][1] & 0x7f);
                  ^~~~~~~
   drivers/hwmon/it87.c:1590:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(reg));
--
                  ^~~~~~~
   drivers/hwmon/it87.c:1870:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->beeps >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/it87.c:1870:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->beeps >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/it87.c:1920:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/it87.c:1920:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/it87.c:1943:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", (long)vid_from_reg(data->vid, data-=
>vrm));
                  ^~~~~~~
   drivers/hwmon/it87.c:1943:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", (long)vid_from_reg(data->vid, data-=
>vrm));
                  ^~~~~~~
   drivers/hwmon/it87.c:1973:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/hwmon/it87.c:1973:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/hwmon/it87.c:3311:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&sio_data, 0, sizeof(struct it87_sio_data));
                   ^~~~~~
   drivers/hwmon/it87.c:3311:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(&sio_data, 0, sizeof(struct it87_sio_data));
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
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
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/bus/mhi/core/main.c:203:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, buf_info->v_addr, buf_info->len);
                   ^~~~~~
   drivers/bus/mhi/core/main.c:203:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, buf_info->v_addr, buf_info->len);
                   ^~~~~~
   drivers/bus/mhi/core/main.c:221:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf_info->v_addr, buf_info->bb_addr, buf_info->le=
n);
                   ^~~~~~
   drivers/bus/mhi/core/main.c:221:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf_info->v_addr, buf_info->bb_addr, buf_info->le=
n);
                   ^~~~~~
   drivers/bus/mhi/core/main.c:284:2: warning: Value stored to 'mhi_cntrl' =
is never read [clang-analyzer-deadcode.DeadStores]
           mhi_cntrl =3D mhi_dev->mhi_cntrl;
           ^           ~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:284:2: note: Value stored to 'mhi_cntrl' is =
never read
           mhi_cntrl =3D mhi_dev->mhi_cntrl;
           ^           ~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:467:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:467:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1047:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1047:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1521:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/main.c:1521:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 62 warnings (61 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/hwmon/applesmc.c:390:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cache->key, key, 4);
           ^~~~~~
   drivers/hwmon/applesmc.c:390:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(cache->key, key, 4);
           ^~~~~~
   drivers/hwmon/applesmc.c:392:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cache->type, &info[1], 4);
           ^~~~~~
   drivers/hwmon/applesmc.c:392:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(cache->type, &info[1], 4);
--
   sound/core/seq/seq_memory.c:328:29: note: Field 'ptr' is equal to NULL
                           if (cell->event.data.ext.ptr =3D=3D NULL)
                                                    ^
   sound/core/seq/seq_memory.c:328:4: note: Taking true branch
                           if (cell->event.data.ext.ptr =3D=3D NULL)
                           ^
   sound/core/seq/seq_memory.c:330:8: note: 'tail' is null
                           if (tail)
                               ^~~~
   sound/core/seq/seq_memory.c:330:4: note: Taking false branch
                           if (tail)
                           ^
   sound/core/seq/seq_memory.c:334:8: note: Assuming 'is_chained' is not eq=
ual to 0
                           if (is_chained && src) {
                               ^~~~~~~~~~
   sound/core/seq/seq_memory.c:334:8: note: Left side of '&&' is true
   sound/core/seq/seq_memory.c:334:22: note: Assuming 'src' is null
                           if (is_chained && src) {
                                             ^~~
   sound/core/seq/seq_memory.c:334:8: note: Assuming pointer value is null
                           if (is_chained && src) {
                               ^~~~~~~~~~~~~~~~~
   sound/core/seq/seq_memory.c:334:4: note: Taking false branch
                           if (is_chained && src) {
                           ^
   sound/core/seq/seq_memory.c:337:15: note: Assuming 'is_usrptr' is 0
                           } else if (is_usrptr) {
                                      ^~~~~~~~~
   sound/core/seq/seq_memory.c:337:11: note: Taking false branch
                           } else if (is_usrptr) {
                                  ^
   sound/core/seq/seq_memory.c:343:5: note: Null pointer passed as 2nd argu=
ment to memory copy function
                                   memcpy(&tmp->event, buf, size);
                                   ^                   ~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
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
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   sound/soc/codecs/nau8824.c:845:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
                   ^~~~~~~~
   sound/soc/codecs/nau8824.c:845:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
                   ^~~~~~~~
   sound/soc/codecs/nau8824.c:860:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
                   ^~~~~~~~
   sound/soc/codecs/nau8824.c:860:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
                   ^~~~~~~~
   sound/soc/codecs/nau8824.c:1808:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D nau8824->dev;
                          ^~~   ~~~~~~~~~~~~
   sound/soc/codecs/nau8824.c:1808:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D nau8824->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   sound/soc/codecs/pcm186x.c:268:19: warning: Value stored to 'format' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           snd_pcm_format_t format =3D params_format(params);
                            ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm186x.c:268:19: note: Value stored to 'format' during=
 its initialization is never read
           snd_pcm_format_t format =3D params_format(params);
                            ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   fs/ext4/dir.c:289:3: warning: Value stored to 'offset' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   offset =3D 0;
                   ^        ~
   fs/ext4/dir.c:289:3: note: Value stored to 'offset' is never read
                   offset =3D 0;
                   ^        ~
   fs/ext4/dir.c:466:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_fn->name, ent_name->name, ent_name->len);
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
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   net/can/isotp.c:214:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ncf->data, so->opt.txpad_content, CAN_MAX_DLEN);
                   ^~~~~~
   net/can/isotp.c:214:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(ncf->data, so->opt.txpad_content, CAN_MAX_DLEN);
                   ^~~~~~
   net/can/isotp.c:253:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr, 0, sizeof(*addr));
           ^~~~~~
   net/can/isotp.c:253:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(addr, 0, sizeof(*addr));
           ^~~~~~
   net/can/isotp.c:434:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_put(nskb, len), &cf->data[pcilen], len);
           ^~~~~~
   net/can/isotp.c:434:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(skb_put(nskb, len), &cf->data[pcilen], len);
           ^~~~~~
   net/can/isotp.c:573:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(skb_put(nskb, so->rx.len), so->rx.buf,
                   ^~~~~~
   net/can/isotp.c:573:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(skb_put(nskb, so->rx.len), so->rx.buf,
                   ^~~~~~
   net/can/isotp.c:700:4: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(cf->data, so->opt.txpad_content, cf->len);
                           ^~~~~~
   net/can/isotp.c:700:4: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                           memset(cf->data, so->opt.txpad_content, cf->len);
                           ^~~~~~
   net/can/isotp.c:704:4: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(cf->data, CAN_ISOTP_DEFAULT_PAD_CONTENT,
--
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/sched/cls_fw.c:293:32: note: Assuming the condition is false
                   RCU_INIT_POINTER(fnew->next, rtnl_dereference(pfp->next)=
);
                                                ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:557:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:376:19: note: expanded from macro '__rcu_derefe=
rence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
                            ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/rcupdate.h:391:59: note: expanded from macro 'RCU_INITIALI=
ZER'
   #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                                             ^
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONC=
E'
           __WRITE_ONCE(x, val);                                           \
           ~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                          ^~~
   net/sched/cls_fw.c:293:32: note: Left side of '&&' is false
                   RCU_INIT_POINTER(fnew->next, rtnl_dereference(pfp->next)=
);
                                                ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:557:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:376:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:313:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   net/sched/cls_fw.c:293:32: note: Loop condition is false.  Exiting loop
                   RCU_INIT_POINTER(fnew->next, rtnl_dereference(pfp->next)=
);
                                                ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:557:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:376:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:311:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   net/sched/cls_fw.c:293:32: note: Access to field 'next' results in a der=
eference of a null pointer (loaded from variable 'pfp')
                   RCU_INIT_POINTER(fnew->next, rtnl_dereference(pfp->next)=
);
                                                ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^                         ~
   include/linux/rcupdate.h:557:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^                            ~
   include/linux/rcupdate.h:378:34: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                           ^~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/rcupdate.h:391:59: note: expanded from macro 'RCU_INITIALI=
ZER'
   #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                                             ^
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONC=
E'
           __WRITE_ONCE(x, val);                                           \
                           ^~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                          ^~~
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   net/mac80211/rc80211_minstrel_debugfs.c:71:7: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "\n");
                ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:71:7: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "\n");
                ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:72:7: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p,
                ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:72:7: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p,
                ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:74:7: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p,
                ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:74:7: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p,
                ^~~~~~~
>> net/mac80211/rc80211_minstrel_debugfs.c:87:8: warning: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedO=
rUnsafeBufferHandling]
                   p +=3D sprintf(p, " %3u%s ", mr->bitrate / 2,
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:87:8: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
                   p +=3D sprintf(p, " %3u%s ", mr->bitrate / 2,
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:89:8: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%3u  ", i);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:89:8: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%3u  ", i);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:90:8: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%6u ", mr->perfect_tx_time);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:90:8: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%6u ", mr->perfect_tx_time);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:96:8: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%4u.%1u    %4u.%1u     %3u.%1u"
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:96:8: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%4u.%1u    %4u.%1u     %3u.%1u"
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:108:7: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "\nTotal packet count::    ideal %d      "
                ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:108:7: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "\nTotal packet count::    ideal %d      "
                ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:138:8: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[0]) ?=
 "A" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:138:8: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[0]) ?=
 "A" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:139:8: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[1]) ?=
 "B" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:139:8: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[1]) ?=
 "B" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:140:8: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[2]) ?=
 "C" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:140:8: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[2]) ?=
 "C" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:141:8: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[3]) ?=
 "D" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:141:8: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_tp_rate[3]) ?=
 "D" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:142:8: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_prob_rate) ? =
"P" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:142:8: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
                   p +=3D sprintf(p, "%s" ,((i =3D=3D mi->max_prob_rate) ? =
"P" : ""));
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:144:8: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
                   p +=3D sprintf(p, ",%u%s", mr->bitrate / 2,
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:144:8: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
                   p +=3D sprintf(p, ",%u%s", mr->bitrate / 2,
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:146:8: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%u,", i);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:146:8: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%u,", i);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:147:8: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%u,",mr->perfect_tx_time);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:147:8: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%u,",mr->perfect_tx_time);
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:153:8: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%u.%u,%u.%u,%u.%u,%u,%u,%u,"
                        ^~~~~~~
   net/mac80211/rc80211_minstrel_debugfs.c:153:8: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%u.%u,%u.%u,%u.%u,%u,%u,%u,"
                        ^~~~~~~
   Suppressed 81 warnings (81 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   112 warnings generated.
   drivers/net/wireless/ath/ath11k/mac.c:569:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&arvif_iter, 0, sizeof(struct ath11k_vif_iter));
           ^~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:569:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&arvif_iter, 0, sizeof(struct ath11k_vif_iter));
           ^~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:1935:27: warning: Although the val=
ue stored to 'vht_mcs' is used in the enclosing expression, the value is ne=
ver actually read from 'vht_mcs' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
   drivers/net/wireless/ath/ath11k/mac.c:1935:27: note: Although the value =
stored to 'vht_mcs' is used in the enclosing expression, the value is never=
 actually read from 'vht_mcs'
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
   drivers/net/wireless/ath/ath11k/mac.c:2256:27: warning: Although the val=
ue stored to 'he_mcs' is used in the enclosing expression, the value is nev=
er actually read from 'he_mcs' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, max_nss =3D 0, he_mcs =3D 0; i < NL80211_HE_NSS_MA=
X; i++) {

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
--===============6784283284189035224==--

