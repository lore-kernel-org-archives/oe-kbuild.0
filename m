Content-Type: multipart/mixed; boundary="===============0259240307162933418=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/radio/wl128x/fmdrv_common.c:1348:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length ...
Date: Sun, 08 May 2022 22:13:33 +0800
Message-ID: <202205082207.T2BtIaZP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0259240307162933418==
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
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   8 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220508 (https://download.01.org/0day-ci/arc=
hive/20220508/202205082207.T2BtIaZP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
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
                   ^~~~~~~~
   net/8021q/vlan.c:254:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, IFNAMSIZ, "vlan%.4i", vlan_id);
                   ^~~~~~~~
   net/8021q/vlan.c:254:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(name, IFNAMSIZ, "vlan%.4i", vlan_id);
                   ^~~~~~~~
   Suppressed 78 warnings (78 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/iio/magnetometer/ak8974.c:477:3: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tab, 0xFF, tab_size);
                   ^~~~~~
   drivers/iio/magnetometer/ak8974.c:477:3: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                   memset(tab, 0xFF, tab_size);
                   ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   sound/core/seq/seq_midi_event.c:340:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, xbuf, qlen);
                   ^~~~~~
   sound/core/seq/seq_midi_event.c:340:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, xbuf, qlen);
                   ^~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   drivers/media/radio/wl128x/fmdrv_common.c:489:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(response, skb->data, evt_hdr->dlen);
                   ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:489:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(response, skb->data, evt_hdr->dlen);
                   ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:585:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fmdev->irq_info.flag, skb->data, fm_evt_hdr->dlen);
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:585:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fmdev->irq_info.flag, skb->data, fm_evt_hdr->dlen);
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:741:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rds_fmt.data.groupdatabuff.buff[idx], rds_data,
                   ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:741:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&rds_fmt.data.groupdatabuff.buff[idx], rds_data,
                   ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:761:4: warning: Value stored t=
o 'group_idx' is never read [clang-analyzer-deadcode.DeadStores]
                           group_idx =3D (rds_fmt.data.groupgeneral.blk_b[0=
] >> 3);
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:761:4: note: Value stored to '=
group_idx' is never read
                           group_idx =3D (rds_fmt.data.groupgeneral.blk_b[0=
] >> 3);
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:794:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rds->buff[rds->wr_idx], &tmpbuf, FM_RDS_BLK_SIZE=
);
                   ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:794:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&rds->buff[rds->wr_idx], &tmpbuf, FM_RDS_BLK_SIZE=
);
                   ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:979:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&read_freq, skb->data, sizeof(read_freq));
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:979:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&read_freq, skb->data, sizeof(read_freq));
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1090:3: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(tmpbuf, &fmdev->rx.rds.buff[fmdev->rx.rds.rd_idx],
                   ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1090:3: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(tmpbuf, &fmdev->rx.rds.buff[fmdev->rx.rds.rd_idx],
                   ^~~~~~
>> drivers/media/radio/wl128x/fmdrv_common.c:1348:2: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
           sprintf(fw_name, "%s_%x.%d.bts", FM_FMC_FW_FILE_START,
           ^~~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1348:2: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
           sprintf(fw_name, "%s_%x.%d.bts", FM_FMC_FW_FILE_START,
           ^~~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1356:2: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
           sprintf(fw_name, "%s_%x.%d.bts", (mode =3D=3D FM_MODE_RX) ?
           ^~~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1356:2: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
           sprintf(fw_name, "%s_%x.%d.bts", (mode =3D=3D FM_MODE_RX) ?
           ^~~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1456:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_push(skb, 1), &skb->cb[0], 1);
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1456:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_push(skb, 1), &skb->cb[0], 1);
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1490:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fm_st_proto, 0, sizeof(fm_st_proto));
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1490:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(&fm_st_proto, 0, sizeof(fm_st_proto));
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1601:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fm_st_proto, 0, sizeof(fm_st_proto));
           ^~~~~~
   drivers/media/radio/wl128x/fmdrv_common.c:1601:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(&fm_st_proto, 0, sizeof(fm_st_proto));
           ^~~~~~
   Suppressed 65 warnings (64 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/mmc/host/mtk-sd.c:680:2: warning: Value stored to 'sg' is never =
read [clang-analyzer-deadcode.DeadStores]
           sg =3D data->sg;
           ^    ~~~~~~~~
   drivers/mmc/host/mtk-sd.c:680:2: note: Value stored to 'sg' is never read
           sg =3D data->sg;
           ^    ~~~~~~~~
   drivers/mmc/host/mtk-sd.c:1054:2: warning: Value stored to 'read' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           read =3D data->flags & MMC_DATA_READ;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:1054:2: note: Value stored to 'read' is never =
read
           read =3D data->flags & MMC_DATA_READ;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:1797:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(gpd, 0, sizeof(struct mt_gpdma_desc) * 2);
           ^~~~~~
   drivers/mmc/host/mtk-sd.c:1797:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(gpd, 0, sizeof(struct mt_gpdma_desc) * 2);
           ^~~~~~
   drivers/mmc/host/mtk-sd.c:1813:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bd, 0, sizeof(struct mt_bdma_desc) * MAX_BD_NUM);
           ^~~~~~
   drivers/mmc/host/mtk-sd.c:1813:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(bd, 0, sizeof(struct mt_bdma_desc) * MAX_BD_NUM);
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/mmc/host/tifm_sd.c:216:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_buf, src_buf, count);
           ^~~~~~
   drivers/mmc/host/tifm_sd.c:216:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst_buf, src_buf, count);
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/usb/line6/capture.c:107:4: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(runtime->dma_area +
                           ^~~~~~
   sound/usb/line6/capture.c:107:4: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                           memcpy(runtime->dma_area +
                           ^~~~~~
   sound/usb/line6/capture.c:110:4: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(runtime->dma_area, fbuf + len * bytes_per=
_frame,
                           ^~~~~~
   sound/usb/line6/capture.c:110:4: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                           memcpy(runtime->dma_area, fbuf + len * bytes_per=
_frame,
                           ^~~~~~
   sound/usb/line6/capture.c:119:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(runtime->dma_area +
                   ^~~~~~
   sound/usb/line6/capture.c:119:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(runtime->dma_area +
                   ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/usb/gadget/udc/goku_udc.c:1618:5: warning: Dereference of null p=
ointer [clang-analyzer-core.NullDereference]
                                   dev->driver->driver.name);
                                   ^
   drivers/usb/gadget/udc/goku_udc.h:288:37: note: expanded from macro 'INF=
O'
           xprintk(dev , KERN_INFO , fmt , ## args)

vim +1348 drivers/media/radio/wl128x/fmdrv_common.c

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1305  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1306  /* Does FM power on seque=
nce */
a61278037b57b1 Xi Wang          2011-12-02  1307  static int fm_power_up(st=
ruct fmdev *fmdev, u8 mode)
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1308  {
2a8b7e5888f5f1 Hans Verkuil     2014-08-20  1309  	u16 payload;
9c2ccc324b3a6c Dan Carpenter    2019-03-26  1310  	__be16 asic_id =3D 0, as=
ic_ver =3D 0;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1311  	int resp_len, ret;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1312  	u8 fw_name[50];
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1313  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1314  	if (mode >=3D FM_MODE_EN=
TRY_MAX) {
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1315  		fmerr("Invalid firmware=
 download option\n");
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1316  		return -EINVAL;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1317  	}
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1318  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1319  	/*
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1320  	 * Initialize FM common =
module. FM GPIO toggling is
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1321  	 * taken care in Shared =
Transport driver.
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1322  	 */
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1323  	ret =3D fmc_prepare(fmde=
v);
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1324  	if (ret < 0) {
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1325  		fmerr("Unable to prepar=
e FM Common\n");
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1326  		return ret;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1327  	}
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1328  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1329  	payload =3D FM_ENABLE;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1330  	if (fmc_send_cmd(fmdev, =
FM_POWER_MODE, REG_WR, &payload,
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1331  			sizeof(payload), NULL,=
 NULL))
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1332  		goto rel;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1333  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1334  	/* Allow the chip to set=
tle down in Channel-8 mode */
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1335  	msleep(20);
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1336  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1337  	if (fmc_send_cmd(fmdev, =
ASIC_ID_GET, REG_RD, NULL,
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1338  			sizeof(asic_id), &asic=
_id, &resp_len))
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1339  		goto rel;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1340  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1341  	if (fmc_send_cmd(fmdev, =
ASIC_VER_GET, REG_RD, NULL,
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1342  			sizeof(asic_ver), &asi=
c_ver, &resp_len))
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1343  		goto rel;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1344  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1345  	fmdbg("ASIC ID: 0x%x , A=
SIC Version: %d\n",
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1346  		be16_to_cpu(asic_id), b=
e16_to_cpu(asic_ver));
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1347  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11 @1348  	sprintf(fw_name, "%s_%x.=
%d.bts", FM_FMC_FW_FILE_START,
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1349  		be16_to_cpu(asic_id), b=
e16_to_cpu(asic_ver));
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1350  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1351  	ret =3D fm_download_firm=
ware(fmdev, fw_name);
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1352  	if (ret < 0) {
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1353  		fmdbg("Failed to downlo=
ad firmware file %s\n", fw_name);
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1354  		goto rel;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1355  	}
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1356  	sprintf(fw_name, "%s_%x.=
%d.bts", (mode =3D=3D FM_MODE_RX) ?
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1357  			FM_RX_FW_FILE_START : =
FM_TX_FW_FILE_START,
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1358  			be16_to_cpu(asic_id), =
be16_to_cpu(asic_ver));
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1359  =

e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1360  	ret =3D fm_download_firm=
ware(fmdev, fw_name);
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1361  	if (ret < 0) {
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1362  		fmdbg("Failed to downlo=
ad firmware file %s\n", fw_name);
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1363  		goto rel;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1364  	} else
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1365  		return ret;
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1366  rel:
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1367  	return fmc_release(fmdev=
);
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1368  }
e8454ff7b9a4d5 Manjunatha Halli 2011-01-11  1369  =


:::::: The code@line 1348 was first introduced by commit
:::::: e8454ff7b9a4d56f02c095bff12d3c92ef4c7fa6 [media] drivers:media:radio=
: wl128x: FM Driver Common sources

:::::: TO: Manjunatha Halli <manjunatha_halli@ti.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0259240307162933418==--

