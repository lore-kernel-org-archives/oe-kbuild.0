Content-Type: multipart/mixed; boundary="===============6060046830747054293=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments...
Date: Wed, 08 Dec 2021 08:10:47 +0800
Message-ID: <202112080821.gP9oyZCP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6060046830747054293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mario Limonciello <mario.limonciello@dell.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28 platform/x86: Move all del=
l drivers to their own subdirectory
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211208/202112080821.gP9oyZCP-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:207:9: note: Calling 'vfs_statx'
           return vfs_statx(dfd, filename, flags | AT_NO_AUTOMOUNT,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:173:2: note: Taking false branch
           if (flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT | AT_EMPTY_P=
ATH |
           ^
   fs/stat.c:177:2: note: Taking false branch
           if (!(flags & AT_SYMLINK_NOFOLLOW))
           ^
   fs/stat.c:179:2: note: Taking false branch
           if (!(flags & AT_NO_AUTOMOUNT))
           ^
   fs/stat.c:181:2: note: Taking false branch
           if (flags & AT_EMPTY_PATH)
           ^
   fs/stat.c:186:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/stat.c:186:2: note: Taking false branch
           if (error)
           ^
   fs/stat.c:189:10: note: Calling 'vfs_getattr'
           error =3D vfs_getattr(&path, stat, request_mask, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:122:6: note: Assuming 'retval' is not equal to 0
           if (retval)
               ^~~~~~
   fs/stat.c:122:2: note: Taking true branch
           if (retval)
           ^
   fs/stat.c:123:3: note: Returning without writing to '->result_mask'
                   return retval;
                   ^
   fs/stat.c:189:10: note: Returning from 'vfs_getattr'
           error =3D vfs_getattr(&path, stat, request_mask, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:191:20: note: The left expression of the compound assignment i=
s an uninitialized value. The computed value will also be garbage
           stat->result_mask |=3D STATX_MNT_ID;
           ~~~~~~~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/char/tpm/tpm_tis_core.c:455:2: warning: Value stored to 'rc' is =
never read [clang-analyzer-deadcode.DeadStores]
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:455:2: note: Value stored to 'rc' is nev=
er read
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/char/tpm/tpm_infineon.c:172:3: warning: Value stored to 'status'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D tpm_data_in(RDFIFO);
                   ^        ~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_infineon.c:172:3: note: Value stored to 'status' is=
 never read
                   status =3D tpm_data_in(RDFIFO);
                   ^        ~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/w1/slaves/w1_ds28e17.c:723:2: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(data->adapter.name, sl->name);
           ^~~~~~
   drivers/w1/slaves/w1_ds28e17.c:723:2: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
           strcat(data->adapter.name, sl->name);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   include/linux/skbuff.h:2071:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^
   net/ipv6/ip6_output.c:1799:8: note: Calling '__skb_dequeue'
           skb =3D __skb_dequeue(queue);
                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2086:6: note: Assuming 'skb' is non-null
           if (skb)
--
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (10 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/tuners/r820t.c:1856:2: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           rc =3D r820t_section(priv, compare_iq);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/r820t.c:1856:2: note: Value stored to 'rc' is never=
 read
           rc =3D r820t_section(priv, compare_iq);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/staging/comedi/drivers/das08.c:181:2: warning: Value stored to '=
range' is never read [clang-analyzer-deadcode.DeadStores]
           range =3D CR_RANGE(insn->chanspec);
           ^
   drivers/staging/comedi/drivers/das08.c:181:2: note: Value stored to 'ran=
ge' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/platform/x86/dell/dell-laptop.c:1596:4: warning: Value stored to=
 'unit' is never read [clang-analyzer-deadcode.DeadStores]
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1596:4: note: Value stored to 'u=
nit' is never read
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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
   11 warnings generated.
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
   7 warnings generated.
   drivers/staging/comedi/drivers/das800.c:90:8: warning: Excessive padding=
 in 'struct das800_board' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   ai_range, =

   ai_speed, =

   resolution, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct das800_board {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/staging/comedi/drivers/das800.c:90:8: note: Excessive padding in=
 'struct das800_board' (8 padding bytes, where 0 is optimal). Optimal field=
s order: name, ai_range, ai_speed, resolution, consider reordering the fiel=
ds or adding explicit padding members
   struct das800_board {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/staging/comedi/drivers/dt2814.c:203:2: warning: Value stored to =
'data' is never read [clang-analyzer-deadcode.DeadStores]
           data =3D (hi << 4) | (lo >> 4);
           ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/comedi/drivers/dt2814.c:203:2: note: Value stored to 'da=
ta' is never read
           data =3D (hi << 4) | (lo >> 4);
           ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/comedi/drivers/dt2814.c:244:2: warning: Value stored to =
'i' is never read [clang-analyzer-deadcode.DeadStores]
           i =3D inb(dev->iobase + DT2814_DATA);
           ^
   drivers/staging/comedi/drivers/dt2814.c:244:2: note: Value stored to 'i'=
 is never read
   drivers/staging/comedi/drivers/dt2814.c:245:2: warning: Value stored to =
'i' is never read [clang-analyzer-deadcode.DeadStores]
           i =3D inb(dev->iobase + DT2814_DATA);
           ^
   drivers/staging/comedi/drivers/dt2814.c:245:2: note: Value stored to 'i'=
 is never read
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.

vim +158 drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  129  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  130  /**
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  131   * populate_enum_data() - Populate all propertie=
s of an instance under enumeration attribute
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  132   * @enumeration_obj: ACPI object with enumeratio=
n data
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  133   * @instance_id: The instance to enumerate
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  134   * @attr_name_kobj: The parent kernel object
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  135   */
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  136  int populate_enum_data(union acpi_object *enumer=
ation_obj, int instance_id,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  137  			struct kobject *attr_name_kobj)
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  138  {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  139  	int i, next_obj, value_modifier_count, possible=
_values_count;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  140  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  141  	wmi_priv.enumeration_data[instance_id].attr_nam=
e_kobj =3D attr_name_kobj;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  142  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].attribute_name,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  143  		enumeration_obj[ATTR_NAME].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  144  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].display_name_language_code,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  145  		enumeration_obj[DISPL_NAME_LANG_CODE].string.p=
ointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  146  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].display_name,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  147  		enumeration_obj[DISPLAY_NAME].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  148  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].default_value,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  149  		enumeration_obj[DEFAULT_VAL].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  150  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].dell_modifier,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  151  		enumeration_obj[MODIFIER].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  152  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  153  	next_obj =3D MODIFIER + 1;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  154  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  155  	value_modifier_count =3D (uintptr_t)enumeration=
_obj[next_obj].string.pointer;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  156  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  157  	for (i =3D 0; i < value_modifier_count; i++) {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27 @158  		strcat(wmi_priv.enumeration_data[instance_id].=
dell_value_modifier,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  159  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  160  		strcat(wmi_priv.enumeration_data[instance_id].=
dell_value_modifier, ";");
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  161  	}
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  162  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  163  	possible_values_count =3D (uintptr_t) enumerati=
on_obj[++next_obj].string.pointer;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  164  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  165  	for (i =3D 0; i < possible_values_count; i++) {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  166  		strcat(wmi_priv.enumeration_data[instance_id].=
possible_values,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  167  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  168  		strcat(wmi_priv.enumeration_data[instance_id].=
possible_values, ";");
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  169  	}
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  170  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  171  	return sysfs_create_group(attr_name_kobj, &enum=
eration_attr_group);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  172  }
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  173  =


:::::: The code@line 158 was first introduced by commit
:::::: e8a60aa7404bfef37705da5607c97737073ac38d platform/x86: Introduce sup=
port for Systems Management Driver over WMI for Dell Systems

:::::: TO: Divya Bharathi <divya.bharathi@dell.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6060046830747054293==--

