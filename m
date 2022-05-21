Content-Type: multipart/mixed; boundary="===============4775613034889539289=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [netfilter-nf-next:testing 9/12] net/netfilter/core.c:183:2: warning: Value stored to 'hook_bpf_prog' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 21 May 2022 20:27:41 +0800
Message-ID: <202205212004.AUdu1ywN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4775613034889539289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Florian Westphal <fw@strlen.de>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git=
 testing
head:   4456ac35299c131e2ac26b4dc025b257d810277b
commit: 11b2910d788799e8c68df305994260fd79a61e10 [9/12] netfilter: add bpf =
base hook program generator
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20521/202205212004.AUdu1ywN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbb=
ec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next=
.git/commit/?id=3D11b2910d788799e8c68df305994260fd79a61e10
        git remote add netfilter-nf-next git://git.kernel.org/pub/scm/linux=
/kernel/git/netfilter/nf-next.git
        git fetch --no-tags netfilter-nf-next testing
        git checkout 11b2910d788799e8c68df305994260fd79a61e10
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                        ^~~~~~~
   drivers/nvdimm/region_devs.c:444:8: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   rc =3D sprintf(buf, "\n");
                        ^~~~~~~
   drivers/nvdimm/region_devs.c:459:8: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   rc =3D sprintf(buf, "%s\n", dev_name(nd_region->dax_seed=
));
                        ^~~~~~~
   drivers/nvdimm/region_devs.c:459:8: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   rc =3D sprintf(buf, "%s\n", dev_name(nd_region->dax_seed=
));
                        ^~~~~~~
   drivers/nvdimm/region_devs.c:461:8: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rc =3D sprintf(buf, "\n");
                        ^~~~~~~
   drivers/nvdimm/region_devs.c:461:8: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   rc =3D sprintf(buf, "\n");
                        ^~~~~~~
   drivers/nvdimm/region_devs.c:473:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", nd_region->ro);
                  ^~~~~~~
   drivers/nvdimm/region_devs.c:473:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", nd_region->ro);
                  ^~~~~~~
   drivers/nvdimm/region_devs.c:503:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#lx\n", nd_region->align);
                  ^~~~~~~
   drivers/nvdimm/region_devs.c:503:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#lx\n", nd_region->align);
                  ^~~~~~~
   drivers/nvdimm/region_devs.c:568:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#llx\n", nd_region->ndr_start);
                  ^~~~~~~
   drivers/nvdimm/region_devs.c:568:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#llx\n", nd_region->ndr_start);
                  ^~~~~~~
   drivers/nvdimm/region_devs.c:578:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "cpu_cache\n");
                          ^~~~~~~
   drivers/nvdimm/region_devs.c:578:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "cpu_cache\n");
                          ^~~~~~~
   drivers/nvdimm/region_devs.c:580:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "memory_controller\n");
                          ^~~~~~~
   drivers/nvdimm/region_devs.c:580:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "memory_controller\n");
                          ^~~~~~~
   drivers/nvdimm/region_devs.c:582:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "\n");
                          ^~~~~~~
   drivers/nvdimm/region_devs.c:582:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "\n");
                          ^~~~~~~
   drivers/nvdimm/region_devs.c:671:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%s,%llu,%llu,%d\n", dev_name(&nvdimm->dev),
                  ^~~~~~~
   drivers/nvdimm/region_devs.c:671:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%s,%llu,%llu,%d\n", dev_name(&nvdimm->dev),
                  ^~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   net/ethtool/stats.c:122:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&data->stats, 0xff, sizeof(data->stats));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/stats.c:122:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&data->stats, 0xff, sizeof(data->stats));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   111 warnings generated.
>> net/netfilter/core.c:183:2: warning: Value stored to 'hook_bpf_prog' is =
never read [clang-analyzer-deadcode.DeadStores]
           hook_bpf_prog =3D nf_hook_bpf_create(new);
           ^               ~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/core.c:183:2: note: Value stored to 'hook_bpf_prog' is nev=
er read
           hook_bpf_prog =3D nf_hook_bpf_create(new);
           ^               ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 110 warnings (108 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   net/netfilter/nf_log.c:226:3: warning: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   vsnprintf(prefix, sizeof(prefix), fmt, args);
                   ^~~~~~~~~
   net/netfilter/nf_log.c:226:3: note: Call to function 'vsnprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'vsnprintf_s' in case of C11
                   vsnprintf(prefix, sizeof(prefix), fmt, args);
                   ^~~~~~~~~
   net/netfilter/nf_log.c:250:3: warning: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   vsnprintf(prefix, sizeof(prefix), fmt, args);
                   ^~~~~~~~~
   net/netfilter/nf_log.c:250:3: note: Call to function 'vsnprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'vsnprintf_s' in case of C11
                   vsnprintf(prefix, sizeof(prefix), fmt, args);
                   ^~~~~~~~~
   net/netfilter/nf_log.c:273:9: warning: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D vsnprintf(m->buf + m->count, S_SIZE - m->count, =
f, args);
                         ^~~~~~~~~
   net/netfilter/nf_log.c:273:9: note: Call to function 'vsnprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'vsnprintf_s' in case of C11
                   len =3D vsnprintf(m->buf + m->count, S_SIZE - m->count, =
f, args);
                         ^~~~~~~~~
   net/netfilter/nf_log.c:318:14: warning: Value stored to 'net' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net *net =3D seq_file_net(seq);
                       ^~~   ~~~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:318:14: note: Value stored to 'net' during its in=
itialization is never read
           struct net *net =3D seq_file_net(seq);
                       ^~~   ~~~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:330:14: warning: Value stored to 'net' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net *net =3D seq_file_net(s);
                       ^~~   ~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:330:14: note: Value stored to 'net' during its in=
itialization is never read
           struct net *net =3D seq_file_net(s);
                       ^~~   ~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:470:4: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(nf_log_sysctl_fnames[i],
                           ^~~~~~~~
   net/netfilter/nf_log.c:470:4: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                           snprintf(nf_log_sysctl_fnames[i],
                           ^~~~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/hwmon/f71882fg.c:1382:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1382:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1391:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1391:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", speed);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1424:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1424:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1426:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1426:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1460:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1460:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1462:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1462:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1471:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->in[nr] * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1471:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->in[nr] * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1479:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->in1_max * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1479:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->in1_max * 8);
                  ^~~~~~~
   drivers/hwmon/f71882fg.c:1514:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/f71882fg.c:1514:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");

vim +/hook_bpf_prog +183 net/netfilter/core.c

960632ece6949b Aaron Conole     2017-08-24  123  =

960632ece6949b Aaron Conole     2017-08-24  124  static struct nf_hook_entr=
ies *
960632ece6949b Aaron Conole     2017-08-24  125  nf_hook_entries_grow(const=
 struct nf_hook_entries *old,
960632ece6949b Aaron Conole     2017-08-24  126  		     const struct nf_hoo=
k_ops *reg)
960632ece6949b Aaron Conole     2017-08-24  127  {
960632ece6949b Aaron Conole     2017-08-24  128  	unsigned int i, alloc_ent=
ries, nhooks, old_entries;
960632ece6949b Aaron Conole     2017-08-24  129  	struct nf_hook_ops **orig=
_ops =3D NULL;
11b2910d788799 Florian Westphal 2021-06-28  130  	struct bpf_prog *hook_bpf=
_prog;
960632ece6949b Aaron Conole     2017-08-24  131  	struct nf_hook_ops **new_=
ops;
960632ece6949b Aaron Conole     2017-08-24  132  	struct nf_hook_entries *n=
ew;
960632ece6949b Aaron Conole     2017-08-24  133  	bool inserted =3D false;
960632ece6949b Aaron Conole     2017-08-24  134  =

960632ece6949b Aaron Conole     2017-08-24  135  	alloc_entries =3D 1;
960632ece6949b Aaron Conole     2017-08-24  136  	old_entries =3D old ? old=
->num_hook_entries : 0;
960632ece6949b Aaron Conole     2017-08-24  137  =

960632ece6949b Aaron Conole     2017-08-24  138  	if (old) {
960632ece6949b Aaron Conole     2017-08-24  139  		orig_ops =3D nf_hook_ent=
ries_get_hook_ops(old);
960632ece6949b Aaron Conole     2017-08-24  140  =

960632ece6949b Aaron Conole     2017-08-24  141  		for (i =3D 0; i < old_en=
tries; i++) {
960632ece6949b Aaron Conole     2017-08-24  142  			if (orig_ops[i] !=3D &d=
ummy_ops)
960632ece6949b Aaron Conole     2017-08-24  143  				alloc_entries++;
960632ece6949b Aaron Conole     2017-08-24  144  		}
960632ece6949b Aaron Conole     2017-08-24  145  	}
960632ece6949b Aaron Conole     2017-08-24  146  =

960632ece6949b Aaron Conole     2017-08-24  147  	if (alloc_entries > MAX_H=
OOK_COUNT)
960632ece6949b Aaron Conole     2017-08-24  148  		return ERR_PTR(-E2BIG);
960632ece6949b Aaron Conole     2017-08-24  149  =

960632ece6949b Aaron Conole     2017-08-24  150  	new =3D allocate_hook_ent=
ries_size(alloc_entries);
960632ece6949b Aaron Conole     2017-08-24  151  	if (!new)
960632ece6949b Aaron Conole     2017-08-24  152  		return ERR_PTR(-ENOMEM);
960632ece6949b Aaron Conole     2017-08-24  153  =

960632ece6949b Aaron Conole     2017-08-24  154  	new_ops =3D nf_hook_entri=
es_get_hook_ops(new);
960632ece6949b Aaron Conole     2017-08-24  155  =

960632ece6949b Aaron Conole     2017-08-24  156  	i =3D 0;
960632ece6949b Aaron Conole     2017-08-24  157  	nhooks =3D 0;
960632ece6949b Aaron Conole     2017-08-24  158  	while (i < old_entries) {
960632ece6949b Aaron Conole     2017-08-24  159  		if (orig_ops[i] =3D=3D &=
dummy_ops) {
960632ece6949b Aaron Conole     2017-08-24  160  			++i;
960632ece6949b Aaron Conole     2017-08-24  161  			continue;
960632ece6949b Aaron Conole     2017-08-24  162  		}
f92b40a8b2645a Florian Westphal 2017-12-08  163  =

960632ece6949b Aaron Conole     2017-08-24  164  		if (inserted || reg->pri=
ority > orig_ops[i]->priority) {
960632ece6949b Aaron Conole     2017-08-24  165  			new_ops[nhooks] =3D (vo=
id *)orig_ops[i];
960632ece6949b Aaron Conole     2017-08-24  166  			new->hooks[nhooks] =3D =
old->hooks[i];
960632ece6949b Aaron Conole     2017-08-24  167  			i++;
960632ece6949b Aaron Conole     2017-08-24  168  		} else {
960632ece6949b Aaron Conole     2017-08-24  169  			new_ops[nhooks] =3D (vo=
id *)reg;
960632ece6949b Aaron Conole     2017-08-24  170  			new->hooks[nhooks].hook=
 =3D reg->hook;
960632ece6949b Aaron Conole     2017-08-24  171  			new->hooks[nhooks].priv=
 =3D reg->priv;
960632ece6949b Aaron Conole     2017-08-24  172  			inserted =3D true;
960632ece6949b Aaron Conole     2017-08-24  173  		}
960632ece6949b Aaron Conole     2017-08-24  174  		nhooks++;
960632ece6949b Aaron Conole     2017-08-24  175  	}
960632ece6949b Aaron Conole     2017-08-24  176  =

960632ece6949b Aaron Conole     2017-08-24  177  	if (!inserted) {
960632ece6949b Aaron Conole     2017-08-24  178  		new_ops[nhooks] =3D (voi=
d *)reg;
960632ece6949b Aaron Conole     2017-08-24  179  		new->hooks[nhooks].hook =
=3D reg->hook;
960632ece6949b Aaron Conole     2017-08-24  180  		new->hooks[nhooks].priv =
=3D reg->priv;
960632ece6949b Aaron Conole     2017-08-24  181  	}
960632ece6949b Aaron Conole     2017-08-24  182  =

11b2910d788799 Florian Westphal 2021-06-28 @183  	hook_bpf_prog =3D nf_hook=
_bpf_create(new);
11b2910d788799 Florian Westphal 2021-06-28  184  =

11b2910d788799 Florian Westphal 2021-06-28  185  	/* allocate_hook_entries_=
size() pre-inits ->hook_prog
11b2910d788799 Florian Westphal 2021-06-28  186  	 * to a fallback program =
that calls nf_hook_slow().
11b2910d788799 Florian Westphal 2021-06-28  187  	 *
11b2910d788799 Florian Westphal 2021-06-28  188  	 * Alternatively we could=
 have nf_hook_entries_grow()
11b2910d788799 Florian Westphal 2021-06-28  189  	 * return an error here.
11b2910d788799 Florian Westphal 2021-06-28  190  	 */
11b2910d788799 Florian Westphal 2021-06-28  191  #if IS_ENABLED(CONFIG_NF_H=
OOK_BPF)
11b2910d788799 Florian Westphal 2021-06-28  192  	if (hook_bpf_prog) {
11b2910d788799 Florian Westphal 2021-06-28  193  		struct bpf_prog *old_pro=
g =3D NULL;
11b2910d788799 Florian Westphal 2021-06-28  194  =

11b2910d788799 Florian Westphal 2021-06-28  195  		new->hook_prog =3D hook_=
bpf_prog;
11b2910d788799 Florian Westphal 2021-06-28  196  =

11b2910d788799 Florian Westphal 2021-06-28  197  		if (old)
11b2910d788799 Florian Westphal 2021-06-28  198  			old_prog =3D old->hook_=
prog;
11b2910d788799 Florian Westphal 2021-06-28  199  =

11b2910d788799 Florian Westphal 2021-06-28  200  		nf_hook_bpf_change_prog(=
BPF_DISPATCHER_PTR(nf_hook_base),
11b2910d788799 Florian Westphal 2021-06-28  201  					old_prog, hook_bpf_pr=
og);
11b2910d788799 Florian Westphal 2021-06-28  202  	}
11b2910d788799 Florian Westphal 2021-06-28  203  #endif
960632ece6949b Aaron Conole     2017-08-24  204  	return new;
960632ece6949b Aaron Conole     2017-08-24  205  }
960632ece6949b Aaron Conole     2017-08-24  206  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4775613034889539289==--

