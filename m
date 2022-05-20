Content-Type: multipart/mixed; boundary="===============0700705925266568826=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-log-userspace-base.c:150:15: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argumen...
Date: Fri, 20 May 2022 15:54:03 +0800
Message-ID: <202205201557.dzTD7K3e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0700705925266568826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b015dcd62b86d298829990f8261d5d154b8d7af5
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   10 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 weeks ago
config: arm-randconfig-c002-20220518 (https://download.01.org/0day-ci/archi=
ve/20220520/202205201557.dzTD7K3e-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                              ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1251:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(timer, &snd_timer_list, device_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/core/timer.c:1252:7: note: Assuming field 'card' is null
                   if (timer->card && timer->card->shutdown)
                       ^~~~~~~~~~~
   sound/core/timer.c:1252:19: note: Left side of '&&' is false
                   if (timer->card && timer->card->shutdown)
                                   ^
   sound/core/timer.c:1254:3: note: Control jumps to 'case SNDRV_TIMER_CLAS=
S_PCM:'  at line 1262
                   switch (timer->tmr_class) {
                   ^
   sound/core/timer.c:1263:39: note: Access to field 'number' results in a =
dereference of a null pointer (loaded from field 'card')
                           snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->=
number,
                                                              ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1358:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&tu->tqueue[tu->qtail++], tread, sizeof(*tread));
                   ^~~~~~
   sound/core/timer.c:1358:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&tu->tqueue[tu->qtail++], tread, sizeof(*tread));
                   ^~~~~~
   sound/core/timer.c:1378:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&r1, 0, sizeof(r1));
           ^~~~~~
   sound/core/timer.c:1378:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&r1, 0, sizeof(r1));
           ^~~~~~
   sound/core/timer.c:1407:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&r1, 0, sizeof(r1));
           ^~~~~~
   sound/core/timer.c:1407:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&r1, 0, sizeof(r1));
           ^~~~~~
   sound/core/timer.c:1408:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tstamp, 0, sizeof(tstamp));
           ^~~~~~
   sound/core/timer.c:1408:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&tstamp, 0, sizeof(tstamp));
           ^~~~~~
   sound/core/timer.c:1654:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ginfo, 0, sizeof(*ginfo));
           ^~~~~~
   sound/core/timer.c:1654:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(ginfo, 0, sizeof(*ginfo));
           ^~~~~~
   sound/core/timer.c:1728:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&gstatus, 0, sizeof(gstatus));
           ^~~~~~
   sound/core/timer.c:1728:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&gstatus, 0, sizeof(gstatus));
           ^~~~~~
   sound/core/timer.c:1770:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(str, "application %i", current->pid);
           ^~~~~~~
   sound/core/timer.c:1770:2: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           sprintf(str, "application %i", current->pid);
           ^~~~~~~
   sound/core/timer.c:1903:4: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&tread, 0, sizeof(tread));
                           ^~~~~~
   sound/core/timer.c:1903:4: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                           memset(&tread, 0, sizeof(tread));
                           ^~~~~~
   sound/core/timer.c:1936:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&status, 0, sizeof(status));
           ^~~~~~
   sound/core/timer.c:1936:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&status, 0, sizeof(status));
           ^~~~~~
   sound/core/timer.c:1959:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&status, 0, sizeof(status));
           ^~~~~~
   sound/core/timer.c:1959:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&status, 0, sizeof(status));
           ^~~~~~
   sound/core/timer.c:2214:4: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&tread32, 0, sizeof(tread32));
                           ^~~~~~
   sound/core/timer.c:2214:4: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                           memset(&tread32, 0, sizeof(tread32));
                           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/md/dm-log-userspace-base.c:148:13: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           str_size =3D sprintf(str, "%llu", (unsigned long long)ti->len);
                      ^~~~~~~
   drivers/md/dm-log-userspace-base.c:148:13: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           str_size =3D sprintf(str, "%llu", (unsigned long long)ti->len);
                      ^~~~~~~
>> drivers/md/dm-log-userspace-base.c:150:15: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   str_size +=3D sprintf(str + str_size, " %s", argv[i]);
                               ^~~~~~~
   drivers/md/dm-log-userspace-base.c:150:15: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   str_size +=3D sprintf(str + str_size, " %s", argv[i]);
                               ^~~~~~~
   drivers/md/dm-log-userspace-base.c:226:2: warning: Call to function 'str=
ncpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'strncpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(lc->uuid, argv[0], DM_UUID_LEN);
           ^~~~~~~
   drivers/md/dm-log-userspace-base.c:226:2: note: Call to function 'strncp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(lc->uuid, argv[0], DM_UUID_LEN);
           ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   drivers/md/dm-log-userspace-transfer.c:61:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(msg, 0, sizeof(struct cn_msg));
           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:61:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(msg, 0, sizeof(struct cn_msg));
           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:119:4: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pkg->data, tfr->data, tfr->data_size);
                           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:119:4: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(pkg->data, tfr->data, tfr->data_size);
                           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:200:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tfr, 0, DM_ULOG_PREALLOCED_SIZE - sizeof(struct cn_msg));
           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:200:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(tfr, 0, DM_ULOG_PREALLOCED_SIZE - sizeof(struct cn_msg));
           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:201:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tfr->uuid, uuid, DM_UUID_LEN);
           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:201:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tfr->uuid, uuid, DM_UUID_LEN);
           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:215:3: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(tfr->data, data, data_size);
                   ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:215:3: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(tfr->data, data, data_size);
                   ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:217:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pkg, 0, sizeof(pkg));
           ^~~~~~
   drivers/md/dm-log-userspace-transfer.c:217:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(&pkg, 0, sizeof(pkg));
           ^~~~~~
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/soc/fsl/fsl_ssi.c:1466:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(ssi->card_name, sizeof(ssi->card_name),
                   ^~~~~~~~
   sound/soc/fsl/fsl_ssi.c:1466:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(ssi->card_name, sizeof(ssi->card_name),
                   ^~~~~~~~
   sound/soc/fsl/fsl_ssi.c:1497:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&ssi->cpu_dai_drv, &fsl_ssi_ac97_dai,
                   ^~~~~~
   sound/soc/fsl/fsl_ssi.c:1497:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&ssi->cpu_dai_drv, &fsl_ssi_ac97_dai,
                   ^~~~~~
   sound/soc/fsl/fsl_ssi.c:1501:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&ssi->cpu_dai_drv, &fsl_ssi_dai_template,
                   ^~~~~~
   sound/soc/fsl/fsl_ssi.c:1501:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&ssi->cpu_dai_drv, &fsl_ssi_dai_template,
                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   net/core/flow_offload.c:208:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cookie->cookie, data, len);
           ^~~~~~
   net/core/flow_offload.c:208:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(cookie->cookie, data, len);
           ^~~~~~
   net/core/flow_offload.c:388:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&bo, 0, sizeof(bo));
                   ^~~~~~
   net/core/flow_offload.c:388:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&bo, 0, sizeof(bo));
                   ^~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   include/net/dst_metadata.h:74:18: warning: Access to field 'type' result=
s in a dereference of a null pointer (loaded from variable 'a') [clang-anal=
yzer-core.NullDereference]
           if (!a !=3D !b || a->type !=3D b->type)
                           ^
   net/core/gro.c:739:37: note: Calling 'dev_gro_receive'
           ret =3D napi_frags_finish(napi, skb, dev_gro_receive(napi, skb));
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:450:2: note: Taking false branch
           if (netif_elide_gro(skb->dev))

vim +150 drivers/md/dm-log-userspace-base.c

f5db4af466e2dc Jonthan Brassow  2009-06-22  124  =

f5db4af466e2dc Jonthan Brassow  2009-06-22  125  static int build_construct=
or_string(struct dm_target *ti,
f5db4af466e2dc Jonthan Brassow  2009-06-22  126  				    unsigned argc, cha=
r **argv,
f5db4af466e2dc Jonthan Brassow  2009-06-22  127  				    char **ctr_str)
f5db4af466e2dc Jonthan Brassow  2009-06-22  128  {
f5db4af466e2dc Jonthan Brassow  2009-06-22  129  	int i, str_size;
f5db4af466e2dc Jonthan Brassow  2009-06-22  130  	char *str =3D NULL;
f5db4af466e2dc Jonthan Brassow  2009-06-22  131  =

f5db4af466e2dc Jonthan Brassow  2009-06-22  132  	*ctr_str =3D NULL;
f5db4af466e2dc Jonthan Brassow  2009-06-22  133  =

5066a4df1f427f Dongmao Zhang    2014-01-15  134  	/*
5066a4df1f427f Dongmao Zhang    2014-01-15  135  	 * Determine overall size=
 of the string.
5066a4df1f427f Dongmao Zhang    2014-01-15  136  	 */
f5db4af466e2dc Jonthan Brassow  2009-06-22  137  	for (i =3D 0, str_size =
=3D 0; i < argc; i++)
f5db4af466e2dc Jonthan Brassow  2009-06-22  138  		str_size +=3D strlen(arg=
v[i]) + 1; /* +1 for space between args */
f5db4af466e2dc Jonthan Brassow  2009-06-22  139  =

f5db4af466e2dc Jonthan Brassow  2009-06-22  140  	str_size +=3D 20; /* Max =
number of chars in a printed u64 number */
f5db4af466e2dc Jonthan Brassow  2009-06-22  141  =

f5db4af466e2dc Jonthan Brassow  2009-06-22  142  	str =3D kzalloc(str_size,=
 GFP_KERNEL);
f5db4af466e2dc Jonthan Brassow  2009-06-22  143  	if (!str) {
f5db4af466e2dc Jonthan Brassow  2009-06-22  144  		DMWARN("Unable to alloca=
te memory for constructor string");
f5db4af466e2dc Jonthan Brassow  2009-06-22  145  		return -ENOMEM;
f5db4af466e2dc Jonthan Brassow  2009-06-22  146  	}
f5db4af466e2dc Jonthan Brassow  2009-06-22  147  =

b8313b6da7e2e7 Jonathan Brassow 2009-09-04 @148  	str_size =3D sprintf(str,=
 "%llu", (unsigned long long)ti->len);
b8313b6da7e2e7 Jonathan Brassow 2009-09-04  149  	for (i =3D 0; i < argc; i=
++)
f5db4af466e2dc Jonthan Brassow  2009-06-22 @150  		str_size +=3D sprintf(st=
r + str_size, " %s", argv[i]);
f5db4af466e2dc Jonthan Brassow  2009-06-22  151  =

f5db4af466e2dc Jonthan Brassow  2009-06-22  152  	*ctr_str =3D str;
f5db4af466e2dc Jonthan Brassow  2009-06-22  153  	return str_size;
f5db4af466e2dc Jonthan Brassow  2009-06-22  154  }
f5db4af466e2dc Jonthan Brassow  2009-06-22  155  =


:::::: The code@line 150 was first introduced by commit
:::::: f5db4af466e2dca0fe822019812d586ca910b00c dm raid1: add userspace log

:::::: TO: Jonthan Brassow <jbrassow@redhat.com>
:::::: CC: Alasdair G Kergon <agk@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0700705925266568826==--

