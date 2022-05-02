Content-Type: multipart/mixed; boundary="===============9032688537515727016=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/bonding/bond_sysfs.c:53:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments ...
Date: Tue, 03 May 2022 00:31:46 +0800
Message-ID: <202205030025.IUu2jwOh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9032688537515727016==
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
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   7 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20220427 (https://download.01.org/0day-ci/arc=
hive/20220503/202205030025.IUu2jwOh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   ^
   drivers/ata/libata-transport.c:371:2: note: expanded from macro 'ata_lin=
k_linkspeed_attr'
           ata_link_show_linkspeed(field, format)                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-transport.c:367:9: note: expanded from macro 'ata_lin=
k_show_linkspeed'
           return sprintf(buf, "%s\n", sata_spd_string(format(link->field))=
); \
                  ^~~~~~~
   drivers/ata/libata-transport.c:375:1: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
   ata_link_linkspeed_attr(sata_spd_limit, fls);
   ^
   drivers/ata/libata-transport.c:371:2: note: expanded from macro 'ata_lin=
k_linkspeed_attr'
           ata_link_show_linkspeed(field, format)                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-transport.c:367:9: note: expanded from macro 'ata_lin=
k_show_linkspeed'
           return sprintf(buf, "%s\n", sata_spd_string(format(link->field))=
); \
                  ^~~~~~~
   drivers/ata/libata-transport.c:375:1: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
   ata_link_linkspeed_attr(sata_spd_limit, fls);
   ^
   drivers/ata/libata-transport.c:371:2: note: expanded from macro 'ata_lin=
k_linkspeed_attr'
           ata_link_show_linkspeed(field, format)                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-transport.c:367:9: note: expanded from macro 'ata_lin=
k_show_linkspeed'
           return sprintf(buf, "%s\n", sata_spd_string(format(link->field))=
); \
                  ^~~~~~~
   drivers/ata/libata-transport.c:376:1: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
   ata_link_linkspeed_attr(sata_spd, noop);
   ^
   drivers/ata/libata-transport.c:371:2: note: expanded from macro 'ata_lin=
k_linkspeed_attr'
           ata_link_show_linkspeed(field, format)                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-transport.c:367:9: note: expanded from macro 'ata_lin=
k_show_linkspeed'
           return sprintf(buf, "%s\n", sata_spd_string(format(link->field))=
); \
                  ^~~~~~~
   drivers/ata/libata-transport.c:376:1: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
   ata_link_linkspeed_attr(sata_spd, noop);
   ^
   drivers/ata/libata-transport.c:371:2: note: expanded from macro 'ata_lin=
k_linkspeed_attr'
           ata_link_show_linkspeed(field, format)                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-transport.c:367:9: note: expanded from macro 'ata_lin=
k_show_linkspeed'
           return sprintf(buf, "%s\n", sata_spd_string(format(link->field))=
); \
                  ^~~~~~~
   drivers/ata/libata-transport.c:534:18: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           arg->written +=3D sprintf(arg->buf + arg->written,
                           ^~~~~~~
   drivers/ata/libata-transport.c:534:18: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           arg->written +=3D sprintf(arg->buf + arg->written,
                           ^~~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
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
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/mfd/madera-core.c:475:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&madera->pdata, dev_get_platdata(madera->dev),
                   ^~~~~~
   drivers/mfd/madera-core.c:475:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&madera->pdata, dev_get_platdata(madera->dev),
                   ^~~~~~
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
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/mfd/tps6507x.c:77:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&msg[1], src, bytes);
           ^~~~~~
   drivers/mfd/tps6507x.c:77:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(&msg[1], src, bytes);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   110 warnings generated.
   drivers/net/bonding/bond_sysfs.c:50:11: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           res +=3D sprintf(buf + res, "++more++ ");
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:50:11: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                           res +=3D sprintf(buf + res, "++more++ ");
                                  ^~~~~~~
>> drivers/net/bonding/bond_sysfs.c:53:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   res +=3D sprintf(buf + res, "%s ", bond->dev->name);
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:53:10: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   res +=3D sprintf(buf + res, "%s ", bond->dev->name);
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:88:2: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sscanf(buffer, "%16s", command); /* IFNAMSIZ*/
           ^~~~~~
   drivers/net/bonding/bond_sysfs.c:88:2: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           sscanf(buffer, "%16s", command); /* IFNAMSIZ*/
           ^~~~~~
   drivers/net/bonding/bond_sysfs.c:181:11: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           res +=3D sprintf(buf + res, "++more++ ");
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:181:11: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                           res +=3D sprintf(buf + res, "++more++ ");
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:184:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
                   res +=3D sprintf(buf + res, "%s ", slave->dev->name);
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:184:10: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
                   res +=3D sprintf(buf + res, "%s ", slave->dev->name);
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:206:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s %d\n", val->string, BOND_MODE(bond));
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:206:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s %d\n", val->string, BOND_MODE(bond));
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:220:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s %d\n", val->string, bond->params.xmit_po=
licy);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:220:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s %d\n", val->string, bond->params.xmit_po=
licy);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:236:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s %d\n", val->string, bond->params.arp_val=
idate);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:236:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s %d\n", val->string, bond->params.arp_val=
idate);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:251:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s %d\n",
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:251:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s %d\n",
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:268:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s %d\n", val->string, bond->params.fail_ov=
er_mac);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:268:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s %d\n", val->string, bond->params.fail_ov=
er_mac);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:280:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", bond->params.arp_interval);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:280:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", bond->params.arp_interval);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:295:11: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           res +=3D sprintf(buf + res, "%pI4 ",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:295:11: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                           res +=3D sprintf(buf + res, "%pI4 ",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:313:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", bond->params.missed_max);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:313:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", bond->params.missed_max);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:325:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", bond->params.downdelay * bond->param=
s.miimon);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:325:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", bond->params.downdelay * bond->param=
s.miimon);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:336:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", bond->params.updelay * bond->params.=
miimon);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:336:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", bond->params.updelay * bond->params.=
miimon);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:348:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:348:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:364:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s %d\n", val->string, bond->params.lacp_ac=
tive);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:364:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s %d\n", val->string, bond->params.lacp_ac=
tive);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:378:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s %d\n", val->string, bond->params.lacp_fa=
st);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs.c:378:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s %d\n", val->string, bond->params.lacp_fa=
st);
--
           ^~~~~~~
   fs/reiserfs/prints.c:669:3: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(print_tb_buf + strlen(print_tb_buf),
                   ^~~~~~~
   fs/reiserfs/prints.c:669:3: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   sprintf(print_tb_buf + strlen(print_tb_buf),
                   ^~~~~~~
   fs/reiserfs/prints.c:689:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(print_tb_buf + strlen(print_tb_buf),
           ^~~~~~~
   fs/reiserfs/prints.c:689:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(print_tb_buf + strlen(print_tb_buf),
           ^~~~~~~
   fs/reiserfs/prints.c:702:3: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(print_tb_buf + strlen(print_tb_buf),
                   ^~~~~~~
   fs/reiserfs/prints.c:702:3: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   sprintf(print_tb_buf + strlen(print_tb_buf),
                   ^~~~~~~
   fs/reiserfs/prints.c:708:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(print_tb_buf + strlen(print_tb_buf),
           ^~~~~~~
   fs/reiserfs/prints.c:708:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(print_tb_buf + strlen(print_tb_buf),
           ^~~~~~~
   fs/reiserfs/prints.c:713:2: warning: Value stored to 'h' is never read [=
clang-analyzer-deadcode.DeadStores]
           h =3D 0;
           ^   ~
   fs/reiserfs/prints.c:713:2: note: Value stored to 'h' is never read
           h =3D 0;
           ^   ~
   fs/reiserfs/prints.c:715:3: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
                   sprintf(print_tb_buf + strlen(print_tb_buf),
                   ^~~~~~~
   fs/reiserfs/prints.c:715:3: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
                   sprintf(print_tb_buf + strlen(print_tb_buf),
                   ^~~~~~~
   fs/reiserfs/prints.c:722:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(print_tb_buf + strlen(print_tb_buf),
           ^~~~~~~
   fs/reiserfs/prints.c:722:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(print_tb_buf + strlen(print_tb_buf),
           ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/mfd/88pm860x-core.c:596:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(status_buf, 0, INT_STATUS_NUM);
           ^~~~~~
   drivers/mfd/88pm860x-core.c:596:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(status_buf, 0, INT_STATUS_NUM);
           ^~~~~~
   drivers/mfd/88pm860x-core.c:604:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(status_buf, 0xFF, INT_STATUS_NUM);
                   ^~~~~~
   drivers/mfd/88pm860x-core.c:604:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(status_buf, 0xFF, INT_STATUS_NUM);
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/mfd/88pm860x-i2c.c:113:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dest, msgbuf1, bytes);
           ^~~~~~
   drivers/mfd/88pm860x-i2c.c:113:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(dest, msgbuf1, bytes);
           ^~~~~~
   drivers/mfd/88pm860x-i2c.c:128:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], src, bytes);
           ^~~~~~
   drivers/mfd/88pm860x-i2c.c:128:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], src, bytes);
           ^~~~~~
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
   drivers/net/bonding/bond_sysfs_slave.c:31:10: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:31:10: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:33:10: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "backup\n");
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:33:10: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "backup\n");
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:35:10: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "UNKNOWN\n");
                          ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:35:10: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "UNKNOWN\n");
                          ^~~~~~~
>> drivers/net/bonding/bond_sysfs_slave.c:42:9: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           return sprintf(buf, "%s\n", bond_slave_link_status(slave->link));
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:42:9: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           return sprintf(buf, "%s\n", bond_slave_link_status(slave->link));
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:48:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", slave->link_failure_count);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:48:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", slave->link_failure_count);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:54:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%*phC\n",
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:54:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%*phC\n",
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:62:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", slave->queue_id);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:62:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", slave->queue_id);
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:73:11: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(buf, "%d\n",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:73:11: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                           return sprintf(buf, "%d\n",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:77:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "N/A\n");
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:77:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "N/A\n");
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:88:11: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(buf, "%u\n",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:88:11: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                           return sprintf(buf, "%u\n",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:92:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "N/A\n");
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:92:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "N/A\n");
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:103:11: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(buf, "%u\n",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:103:11: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
                           return sprintf(buf, "%u\n",
                                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:107:9: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "N/A\n");
                  ^~~~~~~
   drivers/net/bonding/bond_sysfs_slave.c:107:9: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "N/A\n");
                  ^~~~~~~
   Suppressed 68 warnings (68 in non-user code).
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
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
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
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/mtd/nand/raw/nand_toshiba.c:63:29: warning: The left operand of =
'&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           bitflips =3D ecc_status[i] & TOSHIBA_NAND_ECC_ST=
ATUS_MASK;
                                                    ^
   drivers/mtd/nand/raw/nand_toshiba.c:116:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/nand_toshiba.c:116:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/raw/nand_toshiba.c:119:9: note: Calling 'toshiba_nand_b=
enand_eccstatus'
           return toshiba_nand_benand_eccstatus(chip);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:58:8: note: Calling 'toshiba_nand_be=
nand_read_eccstatus_op'
           ret =3D toshiba_nand_benand_read_eccstatus_op(chip, ecc_status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:34:2: note: Taking true branch
           if (nand_has_exec_op(chip)) {
           ^
   drivers/mtd/nand/raw/nand_toshiba.c:39:9: note: '?' condition is true
                                       PSEC_TO_NSEC(sdr->tADL_min)),
--
           if (cs =3D=3D 0 && ctrl->cs0_offsets)
                       ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:6: note: 'cs' is not equal =
to 0
           if (cs && offs_cs1)
               ^~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:6: note: Left side of '&&' =
is true
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:12: note: 'offs_cs1' is 0
           if (cs && offs_cs1)
                     ^~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:2: note: Taking false branch
           if (cs && offs_cs1)
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:857:2: note: Returning without =
writing to 'ctrl->block_sizes', which participates in a condition later
           return offs_cs0 + cs * ctrl->reg_spacing + cs_offs;
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:857:2: note: Returning without =
writing to 'ctrl->page_sizes', which participates in a condition later
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:857:2: note: Returning without =
writing to 'ctrl->max_page_size', which participates in a condition later
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2454:21: note: Returning from '=
brcmnand_cs_offset'
           u16 cfg_ext_offs =3D brcmnand_cs_offset(ctrl, host->cs,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2456:25: note: Calling 'brcmnan=
d_cs_offset'
           u16 acc_control_offs =3D brcmnand_cs_offset(ctrl, host->cs,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:849:6: note: 'cs' is not equal =
to 0
           if (cs =3D=3D 0 && ctrl->cs0_offsets)
               ^~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:849:14: note: Left side of '&&'=
 is false
           if (cs =3D=3D 0 && ctrl->cs0_offsets)
                       ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:6: note: 'cs' is not equal =
to 0
           if (cs && offs_cs1)
               ^~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:6: note: Left side of '&&' =
is true
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:12: note: 'offs_cs1' is 0
           if (cs && offs_cs1)
                     ^~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:854:2: note: Taking false branch
           if (cs && offs_cs1)
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:857:2: note: Returning without =
writing to 'ctrl->block_sizes', which participates in a condition later
           return offs_cs0 + cs * ctrl->reg_spacing + cs_offs;
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:857:2: note: Returning without =
writing to 'ctrl->page_sizes', which participates in a condition later
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:857:2: note: Returning without =
writing to 'ctrl->max_page_size', which participates in a condition later
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2456:25: note: Returning from '=
brcmnand_cs_offset'
           u16 acc_control_offs =3D brcmnand_cs_offset(ctrl, host->cs,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2461:6: note: Assuming field 'b=
lock_sizes' is null
           if (ctrl->block_sizes) {
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2461:2: note: Taking false bran=
ch
           if (ctrl->block_sizes) {
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2475:3: note: The value 244 is =
assigned to 'block_size'
                   block_size =3D ffs(cfg->block_size) - ffs(BRCMNAND_MIN_B=
LOCKSIZE);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2478:6: note: Assuming the cond=
ition is false
           if (cfg->block_size < BRCMNAND_MIN_BLOCKSIZE || (ctrl->max_block=
_size &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2478:6: note: Left side of '||'=
 is false
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2478:51: note: Assuming field '=
max_block_size' is 0
           if (cfg->block_size < BRCMNAND_MIN_BLOCKSIZE || (ctrl->max_block=
_size &&
                                                            ^~~~~~~~~~~~~~~=
~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2478:72: note: Left side of '&&=
' is false
           if (cfg->block_size < BRCMNAND_MIN_BLOCKSIZE || (ctrl->max_block=
_size &&
                                                                           =
      ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2485:6: note: Assuming field 'p=
age_sizes' is null
           if (ctrl->page_sizes) {
               ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2485:2: note: Taking false bran=
ch
           if (ctrl->page_sizes) {
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2502:6: note: Assuming field 'p=
age_size' is >=3D BRCMNAND_MIN_PAGESIZE
           if (cfg->page_size < BRCMNAND_MIN_PAGESIZE || (ctrl->max_page_si=
ze &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2502:6: note: Left side of '||'=
 is false
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2502:49: note: Assuming field '=
max_page_size' is 0
           if (cfg->page_size < BRCMNAND_MIN_PAGESIZE || (ctrl->max_page_si=
ze &&
                                                          ^~~~~~~~~~~~~~~~~=
~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2502:69: note: Left side of '&&=
' is false
           if (cfg->page_size < BRCMNAND_MIN_PAGESIZE || (ctrl->max_page_si=
ze &&
                                                                           =
   ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2508:6: note: Assuming the cond=
ition is false
           if (fls64(cfg->device_size) < fls64(BRCMNAND_MIN_DEVSIZE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2508:2: note: Taking false bran=
ch
           if (fls64(cfg->device_size) < fls64(BRCMNAND_MIN_DEVSIZE)) {
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2518:7: note: Assuming field 'd=
evice_width' is not equal to 16
                   (!!(cfg->device_width =3D=3D 16) << CFG_BUS_WIDTH_SHIFT)=
 |
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2520:6: note: Assuming 'cfg_off=
s' is equal to 'cfg_ext_offs'
           if (cfg_offs =3D=3D cfg_ext_offs) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2520:2: note: Taking true branch
           if (cfg_offs =3D=3D cfg_ext_offs) {
           ^
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2522:22: note: The result of th=
e left shift is undefined due to shifting '244' by '28', which is unreprese=
ntable in the unsigned version of the return type 'int'
                          (block_size << CFG_BLK_SIZE_SHIFT);
                           ~~~~~~~~~~ ^
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2551:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
           buf +=3D sprintf(buf,
                  ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2551:9: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
           buf +=3D sprintf(buf,
                  ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2561:3: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, ", Hamming ECC");
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2561:3: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, ", Hamming ECC");
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2563:3: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, ", BCH-%u (1KiB sector)", cfg->ecc_level <<=
 1);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2563:3: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, ", BCH-%u (1KiB sector)", cfg->ecc_level <<=
 1);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2565:3: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, ", BCH-%u", cfg->ecc_level);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2565:3: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, ", BCH-%u", cfg->ecc_level);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2592:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2592:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   fs/xfs/libxfs/xfs_dir2_node.c:341:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bp->b_addr, 0, sizeof(struct xfs_dir3_free_hdr));
           ^~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:341:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(bp->b_addr, 0, sizeof(struct xfs_dir3_free_hdr));
           ^~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:342:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hdr, 0, sizeof(hdr));
           ^~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:342:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&hdr, 0, sizeof(hdr));
           ^~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:873:43: warning: Access to field 'b_addr' =
results in a dereference of a null pointer (loaded from variable 'curbp') [=
clang-analyzer-core.NullDereference]
                   dep =3D (xfs_dir2_data_entry_t *)((char *)curbp->b_addr +
                                                           ^
   fs/xfs/libxfs/xfs_dir2_node.c:938:6: note: Assuming the condition is fal=
se
           if (args->op_flags & XFS_DA_OP_ADDNAME)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:938:2: note: Taking false branch
           if (args->op_flags & XFS_DA_OP_ADDNAME)
           ^
   fs/xfs/libxfs/xfs_dir2_node.c:941:9: note: Calling 'xfs_dir2_leafn_looku=
p_for_entry'
           return xfs_dir2_leafn_lookup_for_entry(bp, args, indexp, state);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:784:2: note: 'curbp' initialized to a null=
 pointer value
           struct xfs_buf          *curbp =3D NULL;  /* current data/free b=
uffer */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:805:6: note: Assuming field 'count' is > 0
           if (leafhdr.count <=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:805:2: note: Taking false branch
           if (leafhdr.count <=3D 0) {
           ^
   fs/xfs/libxfs/xfs_dir2_node.c:817:6: note: Assuming field 'extravalid' i=
s 0
           if (state->extravalid) {
               ^~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:817:2: note: Taking false branch
           if (state->extravalid) {
           ^
   fs/xfs/libxfs/xfs_dir2_node.c:825:7: note: Assuming 'index' is < field '=
count'
                index < leafhdr.count && be32_to_cpu(lep->hashval) =3D=3D a=
rgs->hashval;
                ^~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:825:7: note: Left side of '&&' is true
   fs/xfs/libxfs/xfs_dir2_node.c:825:32: note: '?' condition is false
                index < leafhdr.count && be32_to_cpu(lep->hashval) =3D=3D a=
rgs->hashval;
                                         ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_dir2_node.c:825:32: note: Assuming the condition is tr=
ue
                index < leafhdr.count && be32_to_cpu(lep->hashval) =3D=3D a=
rgs->hashval;
                                         ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:2: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
           ^
   fs/xfs/libxfs/xfs_dir2_node.c:824:2: note: Loop condition is true.  Ente=
ring loop body
--
           memmove(skb->data, skb->data + iv_len, header_length);
           ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:138:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb->data + header_length, skbdesc->iv, iv_len);
           ^~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:138:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb->data + header_length, skbdesc->iv, iv_len);
           ^~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:194:3: warning: Call t=
o function 'memmove' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memmove_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(skb->data + transfer,
                   ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:194:3: note: Call to f=
unction 'memmove' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(skb->data + transfer,
                   ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:206:3: warning: Call t=
o function 'memmove' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memmove_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(skb->data + transfer,
                   ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:206:3: note: Call to f=
unction 'memmove' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(skb->data + transfer,
                   ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:213:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb->data + transfer, rxdesc->iv, iv_len);
           ^~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:213:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb->data + transfer, rxdesc->iv, iv_len);
           ^~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:221:3: warning: Call t=
o function 'memmove' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memmove_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(skb->data + transfer,
                   ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:221:3: note: Call to f=
unction 'memmove' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(skb->data + transfer,
                   ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:239:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb->data + transfer, &rxdesc->icv, 4);
           ^~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00crypto.c:239:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb->data + transfer, &rxdesc->icv, 4);
           ^~~~~~
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/input/misc/atmel_captouch.c:68:8: warning: Excessive padding in =
'struct atmel_captouch_device' (67 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   xfer_buf, =

   client, =

   input, =

   num_btn, =

   keycodes, =

   prev_btn, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/atmel_captouch.c:68:8: note: Excessive padding in 'st=
ruct atmel_captouch_device' (67 padding bytes, where 3 is optimal). Optimal=
 fields order: xfer_buf, client, input, num_btn, keycodes, prev_btn, consid=
er reordering the fields or adding explicit padding members
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/atmel_captouch.c:118:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, &capdev->xfer_buf[2], len);
           ^~~~~~
   drivers/input/misc/atmel_captouch.c:118:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, &capdev->xfer_buf[2], len);
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/input/misc/da9063_onkey.c:230:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(onkey->phys, sizeof(onkey->phys), "%s/input0",
           ^~~~~~~~
   drivers/input/misc/da9063_onkey.c:230:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(onkey->phys, sizeof(onkey->phys), "%s/input0",
           ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/net/ethernet/broadcom/bgmac-bcma.c:98:3: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(bus_id, sizeof(bus_id), PHY_ID_FMT, bgmac->mii_=
bus->id,
                   ^~~~~~~~
   drivers/net/ethernet/broadcom/bgmac-bcma.c:98:3: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(bus_id, sizeof(bus_id), PHY_ID_FMT, bgmac->mii_=
bus->id,
                   ^~~~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
>> drivers/net/ethernet/broadcom/bgmac-bcma-mdio.c:225:2: warning: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.De=
precatedOrUnsafeBufferHandling]
           sprintf(mii_bus->id, "%s-%d-%d", "bcma_mdio", core->bus->num,
           ^~~~~~~
   drivers/net/ethernet/broadcom/bgmac-bcma-mdio.c:225:2: note: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11
           sprintf(mii_bus->id, "%s-%d-%d", "bcma_mdio", core->bus->num,
           ^~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   drivers/net/ethernet/calxeda/xgmac.c:425:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, sizeof(*p) * ring_size);
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:425:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(p, 0, sizeof(*p) * ring_size);
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:435:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, sizeof(*p) * ring_size);
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:435:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(p, 0, sizeof(*p) * ring_size);
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:1018:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&priv->xstats, 0, sizeof(struct xgmac_extra_stats));
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:1018:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&priv->xstats, 0, sizeof(struct xgmac_extra_stats));
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:1288:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hash_filter, 0, sizeof(hash_filter));
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:1288:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(hash_filter, 0, sizeof(hash_filter));
           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:1626:4: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(p, xgmac_gstrings_stats[i].stat_string,
                           ^~~~~~
   drivers/net/ethernet/calxeda/xgmac.c:1626:4: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(p, xgmac_gstrings_stats[i].stat_string,
                           ^~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/usb/usbip/stub_main.c:36:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:36:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
   drivers/usb/usbip/stub_main.c:158:11: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:158:11: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/mtd/nftlmount.c:143:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(mh, buf, sizeof(struct NFTLMediaHeader));
                   ^~~~~~
   drivers/mtd/nftlmount.c:143:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(mh, buf, sizeof(struct NFTLMediaHeader));
                   ^~~~~~
   drivers/mtd/nftlmount.c:323:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(instr, 0, sizeof(struct erase_info));
           ^~~~~~
   drivers/mtd/nftlmount.c:323:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(instr, 0, sizeof(struct erase_info));
           ^~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/mtd/rfd_ftl.c:263:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0, SECTOR_SIZE);
                   ^~~~~~
   drivers/mtd/rfd_ftl.c:263:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(buf, 0, SECTOR_SIZE);
                   ^~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/mtd/sm_ftl.c:47:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(buf, sm_attr->data, sm_attr->len);
           ^~~~~~~
   drivers/mtd/sm_ftl.c:47:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(buf, sm_attr->data, sm_attr->len);
           ^~~~~~~
   drivers/mtd/sm_ftl.c:250:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(buffer, 0xFF, SM_SECTOR_SIZE);
--
                   ^~~~~~
   Suppressed 94 warnings (94 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   Suppressed 89 warnings (89 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/iio/adc/ti-ads124s08.c:96:8: warning: Excessive padding in 'stru=
ct ads124s_private' (83 padding bytes, where 19 is optimal). =

   Optimal fields order: =

   data, =

   chip_info, =

   reset_gpio, =

   spi, =

   lock, =

   buffer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads124s_private {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads124s08.c:96:8: note: Excessive padding in 'struct =
ads124s_private' (83 padding bytes, where 19 is optimal). Optimal fields or=
der: data, chip_info, reset_gpio, spi, lock, buffer, consider reordering th=
e fields or adding explicit padding members
   struct ads124s_private {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads124s08.c:213:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&priv->data[1], ADS124S08_CMD_NOP, sizeof(priv->data) - 1=
);
           ^~~~~~
   drivers/iio/adc/ti-ads124s08.c:213:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&priv->data[1], ADS124S08_CMD_NOP, sizeof(priv->data) - 1=
);
           ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/iio/adc/ti-tlc4541.c:33:8: warning: Excessive padding in 'struct=
 tlc4541_state' (72 padding bytes, where 8 is optimal). =

   Optimal fields order: =

   rx_buf, =

   spi, =

   reg, =

   scan_single_msg, =

   scan_single_xfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct tlc4541_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tlc4541.c:33:8: note: Excessive padding in 'struct tl=
c4541_state' (72 padding bytes, where 8 is optimal). Optimal fields order: =
rx_buf, spi, reg, scan_single_msg, scan_single_xfer, consider reordering th=
e fields or adding explicit padding members
   struct tlc4541_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/net/ethernet/freescale/fec_ptp.c:104:2: warning: Value stored to=
 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D 0;
           ^     ~
   drivers/net/ethernet/freescale/fec_ptp.c:104:2: note: Value stored to 'v=
al' is never read
           val =3D 0;
           ^     ~
   drivers/net/ethernet/freescale/fec_ptp.c:258:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fep->cc, 0, sizeof(fep->cc));
           ^~~~~~
   drivers/net/ethernet/freescale/fec_ptp.c:258:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&fep->cc, 0, sizeof(fep->cc));
           ^~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/net/ethernet/freescale/fsl_pq_mdio.c:444:2: warning: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pOFn@%llx", np,
           ^~~~~~~~
   drivers/net/ethernet/freescale/fsl_pq_mdio.c:444:2: note: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pOFn@%llx", np,
           ^~~~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   84 warnings generated.
   drivers/net/ethernet/freescale/gianfar.c:1684:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&edata, 0, sizeof(struct ethtool_eee));
           ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:1684:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(&edata, 0, sizeof(struct ethtool_eee));
           ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:1694:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fcb, 0, GMAC_FCB_LEN);
           ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:1694:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(fcb, 0, GMAC_FCB_LEN);
           ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:1841:3: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(skb->data, 0, GMAC_TXPAL_LEN);
                   ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:1841:3: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                   memset(skb->data, 0, GMAC_TXPAL_LEN);
                   ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:2210:4: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&shhwtstamps, 0, sizeof(shhwtstamps));
                           ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:2210:4: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                           memset(&shhwtstamps, 0, sizeof(shhwtstamps));
                           ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:2473:3: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(shhwtstamps, 0, sizeof(*shhwtstamps));
                   ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:2473:3: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                   memset(shhwtstamps, 0, sizeof(*shhwtstamps));
                   ^~~~~~
>> drivers/net/ethernet/freescale/gianfar.c:3325:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           sprintf(gfar_irq(grp, TX)->name, "%s%s%c%s",
                           ^~~~~~~
   drivers/net/ethernet/freescale/gianfar.c:3325:4: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           sprintf(gfar_irq(grp, TX)->name, "%s%s%c%s",
                           ^~~~~~~
   drivers/net/ethernet/freescale/gianfar.c:3327:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           sprintf(gfar_irq(grp, RX)->name, "%s%s%c%s",
                           ^~~~~~~
   drivers/net/ethernet/freescale/gianfar.c:3327:4: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           sprintf(gfar_irq(grp, RX)->name, "%s%s%c%s",
                           ^~~~~~~
   drivers/net/ethernet/freescale/gianfar.c:3329:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           sprintf(gfar_irq(grp, ER)->name, "%s%s%c%s",
                           ^~~~~~~
   drivers/net/ethernet/freescale/gianfar.c:3329:4: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           sprintf(gfar_irq(grp, ER)->name, "%s%s%c%s",
                           ^~~~~~~
   drivers/net/ethernet/freescale/gianfar.c:3332:4: warning: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecur=
eAPI.strcpy]
                           strcpy(gfar_irq(grp, TX)->name, dev->name);
                           ^~~~~~
   drivers/net/ethernet/freescale/gianfar.c:3332:4: note: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119
                           strcpy(gfar_irq(grp, TX)->name, dev->name);
                           ^~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   sound/core/seq/seq_prioq.c:292:16: warning: Access to field 'next' resul=
ts in a dereference of a null pointer (loaded from variable 'prev') [clang-=
analyzer-core.NullDereference]
                                   prev->next =3D cell->next;
                                   ~~~~       ^
   sound/core/seq/seq_prioq.c:279:2: note: 'prev' initialized to a null poi=
nter value
           struct snd_seq_event_cell *prev =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:283:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&f->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   sound/core/seq/seq_prioq.c:283:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&f->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   sound/core/seq/seq_prioq.c:283:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&f->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   sound/core/seq/seq_prioq.c:283:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&f->lock, flags);

vim +53 drivers/net/bonding/bond_sysfs.c

b76cdba9cdb29b Mitch Williams      2005-11-09  30  =

dc3e5d18f2a21f Nikolay Aleksandrov 2014-05-08  31  /* "show" function for t=
he bond_masters attribute.
b76cdba9cdb29b Mitch Williams      2005-11-09  32   * The class parameter i=
s ignored.
b76cdba9cdb29b Mitch Williams      2005-11-09  33   */
28812fe11a2182 Andi Kleen          2010-01-05  34  static ssize_t bonding_s=
how_bonds(struct class *cls,
28812fe11a2182 Andi Kleen          2010-01-05  35  				  struct class_attri=
bute *attr,
28812fe11a2182 Andi Kleen          2010-01-05  36  				  char *buf)
b76cdba9cdb29b Mitch Williams      2005-11-09  37  {
4c22400ab64d43 Eric W. Biederman   2011-10-12  38  	struct bond_net *bn =3D
4c22400ab64d43 Eric W. Biederman   2011-10-12  39  		container_of(attr, str=
uct bond_net, class_attr_bonding_masters);
b76cdba9cdb29b Mitch Williams      2005-11-09  40  	int res =3D 0;
b76cdba9cdb29b Mitch Williams      2005-11-09  41  	struct bonding *bond;
b76cdba9cdb29b Mitch Williams      2005-11-09  42  =

7e0838404541d2 Stephen Hemminger   2009-06-12  43  	rtnl_lock();
b76cdba9cdb29b Mitch Williams      2005-11-09  44  =

ec87fd3b4e111e Eric W. Biederman   2009-10-29  45  	list_for_each_entry(bon=
d, &bn->dev_list, bond_list) {
b76cdba9cdb29b Mitch Williams      2005-11-09  46  		if (res > (PAGE_SIZE -=
 IFNAMSIZ)) {
b76cdba9cdb29b Mitch Williams      2005-11-09  47  			/* not enough space f=
or another interface name */
b76cdba9cdb29b Mitch Williams      2005-11-09  48  			if ((PAGE_SIZE - res)=
 > 10)
b76cdba9cdb29b Mitch Williams      2005-11-09  49  				res =3D PAGE_SIZE - =
10;
b88436651b612b Wagner Ferenc       2007-12-06 @50  			res +=3D sprintf(buf =
+ res, "++more++ ");
b76cdba9cdb29b Mitch Williams      2005-11-09  51  			break;
b76cdba9cdb29b Mitch Williams      2005-11-09  52  		}
b88436651b612b Wagner Ferenc       2007-12-06 @53  		res +=3D sprintf(buf +=
 res, "%s ", bond->dev->name);
b76cdba9cdb29b Mitch Williams      2005-11-09  54  	}
1dcdcd69549c8e Wagner Ferenc       2007-12-06  55  	if (res)
1dcdcd69549c8e Wagner Ferenc       2007-12-06  56  		buf[res-1] =3D '\n'; /=
* eat the leftover space */
7e0838404541d2 Stephen Hemminger   2009-06-12  57  =

7e0838404541d2 Stephen Hemminger   2009-06-12  58  	rtnl_unlock();
b76cdba9cdb29b Mitch Williams      2005-11-09  59  	return res;
b76cdba9cdb29b Mitch Williams      2005-11-09  60  }
b76cdba9cdb29b Mitch Williams      2005-11-09  61  =


:::::: The code at line 53 was first introduced by commit
:::::: b88436651b612be8c29b169af832d80f00f94b7f bonding: Purely cosmetic: r=
ename a local variable

:::::: TO: Wagner Ferenc <wferi@niif.hu>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9032688537515727016==--

