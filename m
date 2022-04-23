Content-Type: multipart/mixed; boundary="===============7750513385062744362=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/rme9652/hdspm.c:6589:2: warning: Value stored to 'io_extent' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 24 Apr 2022 07:09:40 +0800
Message-ID: <202204240737.GhnpnJSl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7750513385062744362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6fc2586d23b574fcd3f6b14430277e91d27cf585
commit: 0195ca5fd1f463ec1b3ea5a23fff672330584616 ALSA: hdspm: Allocate reso=
urces with device-managed APIs
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220420 (https://download.01.org/0day-ci/archi=
ve/20220424/202204240737.GhnpnJSl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0195ca5fd1f463ec1b3ea5a23fff672330584616
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0195ca5fd1f463ec1b3ea5a23fff672330584616
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/soc-ops.c:370:26: warning: The result of the left shift is und=
efined because the right operand is negative [clang-analyzer-core.Undefined=
BinaryOperatorResult]
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-ops.c:370:26: note: The result of the left shift is undefi=
ned because the right operand is negative
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-ops.c:408:26: warning: The result of the left shift is und=
efined because the right operand is negative [clang-analyzer-core.Undefined=
BinaryOperatorResult]
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-ops.c:408:26: note: The result of the left shift is undefi=
ned because the right operand is negative
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   sound/soc/soc-topology.c:1478:2: warning: Value stored to 'control_hdr' =
is never read [clang-analyzer-deadcode.DeadStores]
           control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-topology.c:1478:2: note: Value stored to 'control_hdr' is =
never read
           control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/thunderbolt/switch.c:498:36: warning: Value stored to 'regs' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct tb_regs_port_header *regs =3D &port->config;
                                             ^~~~   ~~~~~~~~~~~~~
   drivers/thunderbolt/switch.c:498:36: note: Value stored to 'regs' during=
 its initialization is never read
           const struct tb_regs_port_header *regs =3D &port->config;
                                             ^~~~   ~~~~~~~~~~~~~
   drivers/thunderbolt/switch.c:1408:38: warning: Value stored to 'regs' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct tb_regs_switch_header *regs =3D &sw->config;
                                               ^~~~   ~~~~~~~~~~~
   drivers/thunderbolt/switch.c:1408:38: note: Value stored to 'regs' durin=
g its initialization is never read
           const struct tb_regs_switch_header *regs =3D &sw->config;
                                               ^~~~   ~~~~~~~~~~~
   drivers/thunderbolt/switch.c:2268:13: warning: Value stored to 'tb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tb *tb =3D sw->tb;
                      ^~   ~~~~~~
   drivers/thunderbolt/switch.c:2268:13: note: Value stored to 'tb' during =
its initialization is never read
           struct tb *tb =3D sw->tb;
                      ^~   ~~~~~~
   drivers/thunderbolt/switch.c:2272:2: warning: Value stored to 'route' is=
 never read [clang-analyzer-deadcode.DeadStores]
           route =3D tb_route(sw);
           ^       ~~~~~~~~~~~~
   drivers/thunderbolt/switch.c:2272:2: note: Value stored to 'route' is ne=
ver read
           route =3D tb_route(sw);
           ^       ~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/pci/rme9652/hdspm.c:1258:3: warning: Value stored to 'status2' is =
never read [clang-analyzer-deadcode.DeadStores]
                   status2 =3D hdspm_read(hdspm, HDSPM_statusRegister2);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdspm.c:1258:3: note: Value stored to 'status2' is nev=
er read
                   status2 =3D hdspm_read(hdspm, HDSPM_statusRegister2);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdspm.c:1259:3: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   status =3D hdspm_read(hdspm, HDSPM_statusRegister);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdspm.c:1259:3: note: Value stored to 'status' is neve=
r read
                   status =3D hdspm_read(hdspm, HDSPM_statusRegister);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdspm.c:6438:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, hdspm->card_name);
           ^~~~~~
   sound/pci/rme9652/hdspm.c:6438:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(pcm->name, hdspm->card_name);
           ^~~~~~
>> sound/pci/rme9652/hdspm.c:6589:2: warning: Value stored to 'io_extent' i=
s never read [clang-analyzer-deadcode.DeadStores]
           io_extent =3D pci_resource_len(pci, 0);
           ^
   sound/pci/rme9652/hdspm.c:6589:2: note: Value stored to 'io_extent' is n=
ever read
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   sound/pci/ymfpci/ymfpci.c:266:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, str);
           ^~~~~~
   sound/pci/ymfpci/ymfpci.c:266:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(card->driver, str);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/md/md-autodetect.c:178:2: warning: Value stored to 'err' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           err =3D -EIO;
           ^     ~~~~
   drivers/md/md-autodetect.c:178:2: note: Value stored to 'err' is never r=
ead
           err =3D -EIO;
           ^     ~~~~
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
   7 warnings generated.
   drivers/scsi/mpt3sas/mpt3sas_transport.c:2104:2: warning: Value stored t=
o 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc =3D 0;
           ^    ~
   drivers/scsi/mpt3sas/mpt3sas_transport.c:2104:2: note: Value stored to '=
rc' is never read
           rc =3D 0;
           ^    ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1173:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(karg.driver_version, ioc->driver_name);
           ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1173:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(karg.driver_version, ioc->driver_name);
           ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1174:2: warning: Call to function 'st=
rcat' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcat(karg.driver_version, "-");
           ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1174:2: note: Call to function 'strca=
t' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcat'. CWE-119
           strcat(karg.driver_version, "-");
           ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1181:3: warning: Call to function 'st=
rcat' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
                   strcat(karg.driver_version, MPT2SAS_DRIVER_VERSION);
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1181:3: note: Call to function 'strca=
t' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcat'. CWE-119
                   strcat(karg.driver_version, MPT2SAS_DRIVER_VERSION);
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1189:3: warning: Call to function 'st=
rcat' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
                   strcat(karg.driver_version, MPT3SAS_DRIVER_VERSION);
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1189:3: note: Call to function 'strca=
t' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcat'. CWE-119
                   strcat(karg.driver_version, MPT3SAS_DRIVER_VERSION);
                   ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   sound/pci/hda/patch_cirrus.c:1649:20: warning: Value stored to 'codec' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
                             ^~~~~
   sound/pci/hda/patch_cirrus.c:1649:20: note: Value stored to 'codec' duri=
ng its initialization is never read
           struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
                             ^~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/pci/hda/patch_hdmi.c:878:3: warning: Value stored to 'pwr' is neve=
r read [clang-analyzer-deadcode.DeadStores]

vim +/io_extent +6589 sound/pci/rme9652/hdspm.c

0dca1793063c28 Adrian Knoth   2011-01-26  6524  =

763f356cd8de9e Takashi Iwai   2005-06-03  6525  	struct pci_dev *pci =3D hd=
spm->pci;
763f356cd8de9e Takashi Iwai   2005-06-03  6526  	int err;
763f356cd8de9e Takashi Iwai   2005-06-03  6527  	unsigned long io_extent;
763f356cd8de9e Takashi Iwai   2005-06-03  6528  =

763f356cd8de9e Takashi Iwai   2005-06-03  6529  	hdspm->irq =3D -1;
763f356cd8de9e Takashi Iwai   2005-06-03  6530  	hdspm->card =3D card;
763f356cd8de9e Takashi Iwai   2005-06-03  6531  =

763f356cd8de9e Takashi Iwai   2005-06-03  6532  	spin_lock_init(&hdspm->loc=
k);
a2e527c5a3ebcf Takashi Iwai   2020-09-03  6533  	INIT_WORK(&hdspm->midi_wor=
k, hdspm_midi_work);
763f356cd8de9e Takashi Iwai   2005-06-03  6534  =

763f356cd8de9e Takashi Iwai   2005-06-03  6535  	pci_read_config_word(hdspm=
->pci,
763f356cd8de9e Takashi Iwai   2005-06-03  6536  			PCI_CLASS_REVISION, &hds=
pm->firmware_rev);
763f356cd8de9e Takashi Iwai   2005-06-03  6537  =

763f356cd8de9e Takashi Iwai   2005-06-03  6538  	strcpy(card->mixername, "X=
ilinx FPGA");
3cee5a60ce1803 Remy Bruno     2006-10-16  6539  	strcpy(card->driver, "HDSP=
M");
0dca1793063c28 Adrian Knoth   2011-01-26  6540  =

0dca1793063c28 Adrian Knoth   2011-01-26  6541  	switch (hdspm->firmware_re=
v) {
0dca1793063c28 Adrian Knoth   2011-01-26  6542  	case HDSPM_RAYDAT_REV:
0dca1793063c28 Adrian Knoth   2011-01-26  6543  		hdspm->io_type =3D RayDAT;
0dca1793063c28 Adrian Knoth   2011-01-26  6544  		hdspm->card_name =3D "RME=
 RayDAT";
0dca1793063c28 Adrian Knoth   2011-01-26  6545  		hdspm->midiPorts =3D 2;
0dca1793063c28 Adrian Knoth   2011-01-26  6546  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6547  	case HDSPM_AIO_REV:
0dca1793063c28 Adrian Knoth   2011-01-26  6548  		hdspm->io_type =3D AIO;
0dca1793063c28 Adrian Knoth   2011-01-26  6549  		hdspm->card_name =3D "RME=
 AIO";
0dca1793063c28 Adrian Knoth   2011-01-26  6550  		hdspm->midiPorts =3D 1;
0dca1793063c28 Adrian Knoth   2011-01-26  6551  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6552  	case HDSPM_MADIFACE_REV:
0dca1793063c28 Adrian Knoth   2011-01-26  6553  		hdspm->io_type =3D MADIfa=
ce;
0dca1793063c28 Adrian Knoth   2011-01-26  6554  		hdspm->card_name =3D "RME=
 MADIface";
0dca1793063c28 Adrian Knoth   2011-01-26  6555  		hdspm->midiPorts =3D 1;
0dca1793063c28 Adrian Knoth   2011-01-26  6556  		break;
c09403dcc5698a Adrian Knoth   2011-10-27  6557  	default:
c09403dcc5698a Adrian Knoth   2011-10-27  6558  		if ((hdspm->firmware_rev =
=3D=3D 0xf0) ||
c09403dcc5698a Adrian Knoth   2011-10-27  6559  			((hdspm->firmware_rev >=
=3D 0xe6) &&
c09403dcc5698a Adrian Knoth   2011-10-27  6560  					(hdspm->firmware_rev <=
=3D 0xea))) {
0dca1793063c28 Adrian Knoth   2011-01-26  6561  			hdspm->io_type =3D AES32;
0dca1793063c28 Adrian Knoth   2011-01-26  6562  			hdspm->card_name =3D "RM=
E AES32";
0dca1793063c28 Adrian Knoth   2011-01-26  6563  			hdspm->midiPorts =3D 2;
05c7cc9ccab7d9 Adrian Knoth   2011-11-21  6564  		} else if ((hdspm->firmwa=
re_rev =3D=3D 0xd2) ||
c09403dcc5698a Adrian Knoth   2011-10-27  6565  			((hdspm->firmware_rev >=
=3D 0xc8)  &&
c09403dcc5698a Adrian Knoth   2011-10-27  6566  				(hdspm->firmware_rev <=
=3D 0xcf))) {
c09403dcc5698a Adrian Knoth   2011-10-27  6567  			hdspm->io_type =3D MADI;
c09403dcc5698a Adrian Knoth   2011-10-27  6568  			hdspm->card_name =3D "RM=
E MADI";
c09403dcc5698a Adrian Knoth   2011-10-27  6569  			hdspm->midiPorts =3D 3;
c09403dcc5698a Adrian Knoth   2011-10-27  6570  		} else {
e3a471d6680487 Takashi Iwai   2014-02-26  6571  			dev_err(card->dev,
e3a471d6680487 Takashi Iwai   2014-02-26  6572  				"unknown firmware revis=
ion %x\n",
5027f347ffe6f7 Adrian Knoth   2011-02-28  6573  				hdspm->firmware_rev);
5027f347ffe6f7 Adrian Knoth   2011-02-28  6574  			return -ENODEV;
3cee5a60ce1803 Remy Bruno     2006-10-16  6575  		}
c09403dcc5698a Adrian Knoth   2011-10-27  6576  	}
763f356cd8de9e Takashi Iwai   2005-06-03  6577  =

0195ca5fd1f463 Takashi Iwai   2021-07-15  6578  	err =3D pcim_enable_device=
(pci);
ef5fa1a49fc3b5 Takashi Iwai   2007-07-27  6579  	if (err < 0)
763f356cd8de9e Takashi Iwai   2005-06-03  6580  		return err;
763f356cd8de9e Takashi Iwai   2005-06-03  6581  =

763f356cd8de9e Takashi Iwai   2005-06-03  6582  	pci_set_master(hdspm->pci);
763f356cd8de9e Takashi Iwai   2005-06-03  6583  =

0195ca5fd1f463 Takashi Iwai   2021-07-15  6584  	err =3D pcim_iomap_regions=
(pci, 1 << 0, "hdspm");
ef5fa1a49fc3b5 Takashi Iwai   2007-07-27  6585  	if (err < 0)
763f356cd8de9e Takashi Iwai   2005-06-03  6586  		return err;
763f356cd8de9e Takashi Iwai   2005-06-03  6587  =

763f356cd8de9e Takashi Iwai   2005-06-03  6588  	hdspm->port =3D pci_resour=
ce_start(pci, 0);
763f356cd8de9e Takashi Iwai   2005-06-03 @6589  	io_extent =3D pci_resource=
_len(pci, 0);
0195ca5fd1f463 Takashi Iwai   2021-07-15  6590  	hdspm->iobase =3D pcim_iom=
ap_table(pci)[0];
e3a471d6680487 Takashi Iwai   2014-02-26  6591  	dev_dbg(card->dev, "remapp=
ed region (0x%lx) 0x%lx-0x%lx\n",
763f356cd8de9e Takashi Iwai   2005-06-03  6592  			(unsigned long)hdspm->io=
base, hdspm->port,
763f356cd8de9e Takashi Iwai   2005-06-03  6593  			hdspm->port + io_extent =
- 1);
763f356cd8de9e Takashi Iwai   2005-06-03  6594  =

0195ca5fd1f463 Takashi Iwai   2021-07-15  6595  	if (devm_request_irq(&pci-=
>dev, pci->irq, snd_hdspm_interrupt,
934c2b6d0cb50f Takashi Iwai   2011-06-10  6596  			     IRQF_SHARED, KBUILD=
_MODNAME, hdspm)) {
e3a471d6680487 Takashi Iwai   2014-02-26  6597  		dev_err(card->dev, "unabl=
e to use IRQ %d\n", pci->irq);
763f356cd8de9e Takashi Iwai   2005-06-03  6598  		return -EBUSY;
763f356cd8de9e Takashi Iwai   2005-06-03  6599  	}
763f356cd8de9e Takashi Iwai   2005-06-03  6600  =

e3a471d6680487 Takashi Iwai   2014-02-26  6601  	dev_dbg(card->dev, "use IR=
Q %d\n", pci->irq);
763f356cd8de9e Takashi Iwai   2005-06-03  6602  =

763f356cd8de9e Takashi Iwai   2005-06-03  6603  	hdspm->irq =3D pci->irq;
39cccf4511fd00 Takashi Iwai   2019-12-10  6604  	card->sync_irq =3D hdspm->=
irq;
763f356cd8de9e Takashi Iwai   2005-06-03  6605  =

e3a471d6680487 Takashi Iwai   2014-02-26  6606  	dev_dbg(card->dev, "kmallo=
c Mixer memory of %zd Bytes\n",
7dfec5075f23cd Markus Elfring 2017-08-12  6607  		sizeof(*hdspm->mixer));
0195ca5fd1f463 Takashi Iwai   2021-07-15  6608  	hdspm->mixer =3D devm_kzal=
loc(&pci->dev, sizeof(*hdspm->mixer), GFP_KERNEL);
9dba54296b8b4a Markus Elfring 2017-08-12  6609  	if (!hdspm->mixer)
b17cbdd85f84c8 Julia Lawall   2012-08-19  6610  		return -ENOMEM;
763f356cd8de9e Takashi Iwai   2005-06-03  6611  =

0dca1793063c28 Adrian Knoth   2011-01-26  6612  	hdspm->port_names_in =3D N=
ULL;
0dca1793063c28 Adrian Knoth   2011-01-26  6613  	hdspm->port_names_out =3D =
NULL;
0dca1793063c28 Adrian Knoth   2011-01-26  6614  =

0dca1793063c28 Adrian Knoth   2011-01-26  6615  	switch (hdspm->io_type) {
0dca1793063c28 Adrian Knoth   2011-01-26  6616  	case AES32:
d2d10a213294d6 Adrian Knoth   2011-02-28  6617  		hdspm->ss_in_channels =3D=
 hdspm->ss_out_channels =3D AES32_CHANNELS;
d2d10a213294d6 Adrian Knoth   2011-02-28  6618  		hdspm->ds_in_channels =3D=
 hdspm->ds_out_channels =3D AES32_CHANNELS;
d2d10a213294d6 Adrian Knoth   2011-02-28  6619  		hdspm->qs_in_channels =3D=
 hdspm->qs_out_channels =3D AES32_CHANNELS;
432d2500ac11ca Adrian Knoth   2011-02-23  6620  =

432d2500ac11ca Adrian Knoth   2011-02-23  6621  		hdspm->channel_map_in_ss =
=3D hdspm->channel_map_out_ss =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6622  			channel_map_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6623  		hdspm->channel_map_in_ds =
=3D hdspm->channel_map_out_ds =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6624  			channel_map_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6625  		hdspm->channel_map_in_qs =
=3D hdspm->channel_map_out_qs =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6626  			channel_map_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6627  		hdspm->port_names_in_ss =
=3D hdspm->port_names_out_ss =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6628  			texts_ports_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6629  		hdspm->port_names_in_ds =
=3D hdspm->port_names_out_ds =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6630  			texts_ports_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6631  		hdspm->port_names_in_qs =
=3D hdspm->port_names_out_qs =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6632  			texts_ports_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6633  =

d2d10a213294d6 Adrian Knoth   2011-02-28  6634  		hdspm->max_channels_out =
=3D hdspm->max_channels_in =3D
d2d10a213294d6 Adrian Knoth   2011-02-28  6635  			AES32_CHANNELS;
432d2500ac11ca Adrian Knoth   2011-02-23  6636  		hdspm->port_names_in =3D =
hdspm->port_names_out =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6637  			texts_ports_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6638  		hdspm->channel_map_in =3D=
 hdspm->channel_map_out =3D
432d2500ac11ca Adrian Knoth   2011-02-23  6639  			channel_map_aes32;
432d2500ac11ca Adrian Knoth   2011-02-23  6640  =

0dca1793063c28 Adrian Knoth   2011-01-26  6641  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6642  =

0dca1793063c28 Adrian Knoth   2011-01-26  6643  	case MADI:
0dca1793063c28 Adrian Knoth   2011-01-26  6644  	case MADIface:
0dca1793063c28 Adrian Knoth   2011-01-26  6645  		hdspm->ss_in_channels =3D=
 hdspm->ss_out_channels =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6646  			MADI_SS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6647  		hdspm->ds_in_channels =3D=
 hdspm->ds_out_channels =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6648  			MADI_DS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6649  		hdspm->qs_in_channels =3D=
 hdspm->qs_out_channels =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6650  			MADI_QS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6651  =

0dca1793063c28 Adrian Knoth   2011-01-26  6652  		hdspm->channel_map_in_ss =
=3D hdspm->channel_map_out_ss =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6653  			channel_map_unity_ss;
01e9607815755f Adrian Knoth   2011-02-23  6654  		hdspm->channel_map_in_ds =
=3D hdspm->channel_map_out_ds =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6655  			channel_map_unity_ss;
01e9607815755f Adrian Knoth   2011-02-23  6656  		hdspm->channel_map_in_qs =
=3D hdspm->channel_map_out_qs =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6657  			channel_map_unity_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6658  =

0dca1793063c28 Adrian Knoth   2011-01-26  6659  		hdspm->port_names_in_ss =
=3D hdspm->port_names_out_ss =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6660  			texts_ports_madi;
0dca1793063c28 Adrian Knoth   2011-01-26  6661  		hdspm->port_names_in_ds =
=3D hdspm->port_names_out_ds =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6662  			texts_ports_madi;
0dca1793063c28 Adrian Knoth   2011-01-26  6663  		hdspm->port_names_in_qs =
=3D hdspm->port_names_out_qs =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6664  			texts_ports_madi;
0dca1793063c28 Adrian Knoth   2011-01-26  6665  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6666  =

0dca1793063c28 Adrian Knoth   2011-01-26  6667  	case AIO:
0dca1793063c28 Adrian Knoth   2011-01-26  6668  		hdspm->ss_in_channels =3D=
 AIO_IN_SS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6669  		hdspm->ds_in_channels =3D=
 AIO_IN_DS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6670  		hdspm->qs_in_channels =3D=
 AIO_IN_QS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6671  		hdspm->ss_out_channels =
=3D AIO_OUT_SS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6672  		hdspm->ds_out_channels =
=3D AIO_OUT_DS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6673  		hdspm->qs_out_channels =
=3D AIO_OUT_QS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6674  =

3de9db264cef4b Adrian Knoth   2013-07-05  6675  		if (0 =3D=3D (hdspm_read(=
hdspm, HDSPM_statusRegister2) & HDSPM_s2_AEBI_D)) {
e3a471d6680487 Takashi Iwai   2014-02-26  6676  			dev_info(card->dev, "AEB=
 input board found\n");
3de9db264cef4b Adrian Knoth   2013-07-05  6677  			hdspm->ss_in_channels +=
=3D 4;
3de9db264cef4b Adrian Knoth   2013-07-05  6678  			hdspm->ds_in_channels +=
=3D 4;
3de9db264cef4b Adrian Knoth   2013-07-05  6679  			hdspm->qs_in_channels +=
=3D 4;
3de9db264cef4b Adrian Knoth   2013-07-05  6680  		}
3de9db264cef4b Adrian Knoth   2013-07-05  6681  =

3de9db264cef4b Adrian Knoth   2013-07-05  6682  		if (0 =3D=3D (hdspm_read(=
hdspm, HDSPM_statusRegister2) & HDSPM_s2_AEBO_D)) {
e3a471d6680487 Takashi Iwai   2014-02-26  6683  			dev_info(card->dev, "AEB=
 output board found\n");
3de9db264cef4b Adrian Knoth   2013-07-05  6684  			hdspm->ss_out_channels +=
=3D 4;
3de9db264cef4b Adrian Knoth   2013-07-05  6685  			hdspm->ds_out_channels +=
=3D 4;
3de9db264cef4b Adrian Knoth   2013-07-05  6686  			hdspm->qs_out_channels +=
=3D 4;
3de9db264cef4b Adrian Knoth   2013-07-05  6687  		}
3de9db264cef4b Adrian Knoth   2013-07-05  6688  =

0dca1793063c28 Adrian Knoth   2011-01-26  6689  		hdspm->channel_map_out_ss=
 =3D channel_map_aio_out_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6690  		hdspm->channel_map_out_ds=
 =3D channel_map_aio_out_ds;
0dca1793063c28 Adrian Knoth   2011-01-26  6691  		hdspm->channel_map_out_qs=
 =3D channel_map_aio_out_qs;
0dca1793063c28 Adrian Knoth   2011-01-26  6692  =

0dca1793063c28 Adrian Knoth   2011-01-26  6693  		hdspm->channel_map_in_ss =
=3D channel_map_aio_in_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6694  		hdspm->channel_map_in_ds =
=3D channel_map_aio_in_ds;
0dca1793063c28 Adrian Knoth   2011-01-26  6695  		hdspm->channel_map_in_qs =
=3D channel_map_aio_in_qs;
0dca1793063c28 Adrian Knoth   2011-01-26  6696  =

0dca1793063c28 Adrian Knoth   2011-01-26  6697  		hdspm->port_names_in_ss =
=3D texts_ports_aio_in_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6698  		hdspm->port_names_out_ss =
=3D texts_ports_aio_out_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6699  		hdspm->port_names_in_ds =
=3D texts_ports_aio_in_ds;
0dca1793063c28 Adrian Knoth   2011-01-26  6700  		hdspm->port_names_out_ds =
=3D texts_ports_aio_out_ds;
0dca1793063c28 Adrian Knoth   2011-01-26  6701  		hdspm->port_names_in_qs =
=3D texts_ports_aio_in_qs;
0dca1793063c28 Adrian Knoth   2011-01-26  6702  		hdspm->port_names_out_qs =
=3D texts_ports_aio_out_qs;
0dca1793063c28 Adrian Knoth   2011-01-26  6703  =

0dca1793063c28 Adrian Knoth   2011-01-26  6704  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6705  =

0dca1793063c28 Adrian Knoth   2011-01-26  6706  	case RayDAT:
0dca1793063c28 Adrian Knoth   2011-01-26  6707  		hdspm->ss_in_channels =3D=
 hdspm->ss_out_channels =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6708  			RAYDAT_SS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6709  		hdspm->ds_in_channels =3D=
 hdspm->ds_out_channels =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6710  			RAYDAT_DS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6711  		hdspm->qs_in_channels =3D=
 hdspm->qs_out_channels =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6712  			RAYDAT_QS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6713  =

0dca1793063c28 Adrian Knoth   2011-01-26  6714  		hdspm->max_channels_in =
=3D RAYDAT_SS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6715  		hdspm->max_channels_out =
=3D RAYDAT_SS_CHANNELS;
0dca1793063c28 Adrian Knoth   2011-01-26  6716  =

0dca1793063c28 Adrian Knoth   2011-01-26  6717  		hdspm->channel_map_in_ss =
=3D hdspm->channel_map_out_ss =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6718  			channel_map_raydat_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6719  		hdspm->channel_map_in_ds =
=3D hdspm->channel_map_out_ds =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6720  			channel_map_raydat_ds;
0dca1793063c28 Adrian Knoth   2011-01-26  6721  		hdspm->channel_map_in_qs =
=3D hdspm->channel_map_out_qs =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6722  			channel_map_raydat_qs;
0dca1793063c28 Adrian Knoth   2011-01-26  6723  		hdspm->channel_map_in =3D=
 hdspm->channel_map_out =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6724  			channel_map_raydat_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6725  =

0dca1793063c28 Adrian Knoth   2011-01-26  6726  		hdspm->port_names_in_ss =
=3D hdspm->port_names_out_ss =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6727  			texts_ports_raydat_ss;
0dca1793063c28 Adrian Knoth   2011-01-26  6728  		hdspm->port_names_in_ds =
=3D hdspm->port_names_out_ds =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6729  			texts_ports_raydat_ds;
0dca1793063c28 Adrian Knoth   2011-01-26  6730  		hdspm->port_names_in_qs =
=3D hdspm->port_names_out_qs =3D
0dca1793063c28 Adrian Knoth   2011-01-26  6731  			texts_ports_raydat_qs;
0dca1793063c28 Adrian Knoth   2011-01-26  6732  =

0dca1793063c28 Adrian Knoth   2011-01-26  6733  =

0dca1793063c28 Adrian Knoth   2011-01-26  6734  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6735  =

0dca1793063c28 Adrian Knoth   2011-01-26  6736  	}
0dca1793063c28 Adrian Knoth   2011-01-26  6737  =

0dca1793063c28 Adrian Knoth   2011-01-26  6738  	/* TCO detection */
0dca1793063c28 Adrian Knoth   2011-01-26  6739  	switch (hdspm->io_type) {
0dca1793063c28 Adrian Knoth   2011-01-26  6740  	case AIO:
0dca1793063c28 Adrian Knoth   2011-01-26  6741  	case RayDAT:
0dca1793063c28 Adrian Knoth   2011-01-26  6742  		if (hdspm_read(hdspm, HDS=
PM_statusRegister2) &
0dca1793063c28 Adrian Knoth   2011-01-26  6743  				HDSPM_s2_tco_detect) {
0dca1793063c28 Adrian Knoth   2011-01-26  6744  			hdspm->midiPorts++;
7dfec5075f23cd Markus Elfring 2017-08-12  6745  			hdspm->tco =3D kzalloc(s=
izeof(*hdspm->tco), GFP_KERNEL);
da2ea374b28aa6 Markus Elfring 2017-08-12  6746  			if (hdspm->tco)
0dca1793063c28 Adrian Knoth   2011-01-26  6747  				hdspm_tco_write(hdspm);
da2ea374b28aa6 Markus Elfring 2017-08-12  6748  =

e3a471d6680487 Takashi Iwai   2014-02-26  6749  			dev_info(card->dev, "AIO=
/RayDAT TCO module found\n");
0dca1793063c28 Adrian Knoth   2011-01-26  6750  		} else {
0dca1793063c28 Adrian Knoth   2011-01-26  6751  			hdspm->tco =3D NULL;
0dca1793063c28 Adrian Knoth   2011-01-26  6752  		}
0dca1793063c28 Adrian Knoth   2011-01-26  6753  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6754  =

0dca1793063c28 Adrian Knoth   2011-01-26  6755  	case MADI:
0dc831b9bca98a Adrian Knoth   2013-07-05  6756  	case AES32:
0dca1793063c28 Adrian Knoth   2011-01-26  6757  		if (hdspm_read(hdspm, HDS=
PM_statusRegister) & HDSPM_tco_detect) {
0dca1793063c28 Adrian Knoth   2011-01-26  6758  			hdspm->midiPorts++;
7dfec5075f23cd Markus Elfring 2017-08-12  6759  			hdspm->tco =3D kzalloc(s=
izeof(*hdspm->tco), GFP_KERNEL);
da2ea374b28aa6 Markus Elfring 2017-08-12  6760  			if (hdspm->tco)
0dca1793063c28 Adrian Knoth   2011-01-26  6761  				hdspm_tco_write(hdspm);
da2ea374b28aa6 Markus Elfring 2017-08-12  6762  =

e3a471d6680487 Takashi Iwai   2014-02-26  6763  			dev_info(card->dev, "MAD=
I/AES TCO module found\n");
0dca1793063c28 Adrian Knoth   2011-01-26  6764  		} else {
0dca1793063c28 Adrian Knoth   2011-01-26  6765  			hdspm->tco =3D NULL;
0dca1793063c28 Adrian Knoth   2011-01-26  6766  		}
0dca1793063c28 Adrian Knoth   2011-01-26  6767  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6768  =

0dca1793063c28 Adrian Knoth   2011-01-26  6769  	default:
0dca1793063c28 Adrian Knoth   2011-01-26  6770  		hdspm->tco =3D NULL;
0dca1793063c28 Adrian Knoth   2011-01-26  6771  	}
0dca1793063c28 Adrian Knoth   2011-01-26  6772  =

0dca1793063c28 Adrian Knoth   2011-01-26  6773  	/* texts */
0dca1793063c28 Adrian Knoth   2011-01-26  6774  	switch (hdspm->io_type) {
0dca1793063c28 Adrian Knoth   2011-01-26  6775  	case AES32:
0dca1793063c28 Adrian Knoth   2011-01-26  6776  		if (hdspm->tco) {
0dca1793063c28 Adrian Knoth   2011-01-26  6777  			hdspm->texts_autosync =
=3D texts_autosync_aes_tco;
e71b95ad71e3ee Adrian Knoth   2013-07-05  6778  			hdspm->texts_autosync_it=
ems =3D
e71b95ad71e3ee Adrian Knoth   2013-07-05  6779  				ARRAY_SIZE(texts_autosy=
nc_aes_tco);
0dca1793063c28 Adrian Knoth   2011-01-26  6780  		} else {
0dca1793063c28 Adrian Knoth   2011-01-26  6781  			hdspm->texts_autosync =
=3D texts_autosync_aes;
e71b95ad71e3ee Adrian Knoth   2013-07-05  6782  			hdspm->texts_autosync_it=
ems =3D
e71b95ad71e3ee Adrian Knoth   2013-07-05  6783  				ARRAY_SIZE(texts_autosy=
nc_aes);
0dca1793063c28 Adrian Knoth   2011-01-26  6784  		}
0dca1793063c28 Adrian Knoth   2011-01-26  6785  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6786  =

0dca1793063c28 Adrian Knoth   2011-01-26  6787  	case MADI:
0dca1793063c28 Adrian Knoth   2011-01-26  6788  		if (hdspm->tco) {
0dca1793063c28 Adrian Knoth   2011-01-26  6789  			hdspm->texts_autosync =
=3D texts_autosync_madi_tco;
0dca1793063c28 Adrian Knoth   2011-01-26  6790  			hdspm->texts_autosync_it=
ems =3D 4;
0dca1793063c28 Adrian Knoth   2011-01-26  6791  		} else {
0dca1793063c28 Adrian Knoth   2011-01-26  6792  			hdspm->texts_autosync =
=3D texts_autosync_madi;
0dca1793063c28 Adrian Knoth   2011-01-26  6793  			hdspm->texts_autosync_it=
ems =3D 3;
0dca1793063c28 Adrian Knoth   2011-01-26  6794  		}
0dca1793063c28 Adrian Knoth   2011-01-26  6795  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6796  =

0dca1793063c28 Adrian Knoth   2011-01-26  6797  	case MADIface:
0dca1793063c28 Adrian Knoth   2011-01-26  6798  =

0dca1793063c28 Adrian Knoth   2011-01-26  6799  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6800  =

0dca1793063c28 Adrian Knoth   2011-01-26  6801  	case RayDAT:
0dca1793063c28 Adrian Knoth   2011-01-26  6802  		if (hdspm->tco) {
0dca1793063c28 Adrian Knoth   2011-01-26  6803  			hdspm->texts_autosync =
=3D texts_autosync_raydat_tco;
0dca1793063c28 Adrian Knoth   2011-01-26  6804  			hdspm->texts_autosync_it=
ems =3D 9;
0dca1793063c28 Adrian Knoth   2011-01-26  6805  		} else {
0dca1793063c28 Adrian Knoth   2011-01-26  6806  			hdspm->texts_autosync =
=3D texts_autosync_raydat;
0dca1793063c28 Adrian Knoth   2011-01-26  6807  			hdspm->texts_autosync_it=
ems =3D 8;
0dca1793063c28 Adrian Knoth   2011-01-26  6808  		}
0dca1793063c28 Adrian Knoth   2011-01-26  6809  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6810  =

0dca1793063c28 Adrian Knoth   2011-01-26  6811  	case AIO:
0dca1793063c28 Adrian Knoth   2011-01-26  6812  		if (hdspm->tco) {
0dca1793063c28 Adrian Knoth   2011-01-26  6813  			hdspm->texts_autosync =
=3D texts_autosync_aio_tco;
0dca1793063c28 Adrian Knoth   2011-01-26  6814  			hdspm->texts_autosync_it=
ems =3D 6;
0dca1793063c28 Adrian Knoth   2011-01-26  6815  		} else {
0dca1793063c28 Adrian Knoth   2011-01-26  6816  			hdspm->texts_autosync =
=3D texts_autosync_aio;
0dca1793063c28 Adrian Knoth   2011-01-26  6817  			hdspm->texts_autosync_it=
ems =3D 5;
0dca1793063c28 Adrian Knoth   2011-01-26  6818  		}
0dca1793063c28 Adrian Knoth   2011-01-26  6819  		break;
0dca1793063c28 Adrian Knoth   2011-01-26  6820  =

0dca1793063c28 Adrian Knoth   2011-01-26  6821  	}
0dca1793063c28 Adrian Knoth   2011-01-26  6822  =

f7de8ba3fcf194 Adrian Knoth   2012-01-10  6823  	if (hdspm->io_type !=3D MA=
DIface) {
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6824  		hdspm->serial =3D (hdspm_=
read(hdspm,
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6825  				HDSPM_midiStatusIn0)>>8=
) & 0xFFFFFF;
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6826  		/* id contains either a u=
ser-provided value or the default
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6827  		 * NULL. If it's the defa=
ult, we're safe to
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6828  		 * fill card->id with the=
 serial number.
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6829  		 *
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6830  		 * If the serial number i=
s 0xFFFFFF, then we're dealing with
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6831  		 * an old PCI revision th=
at comes without a sane number. In
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6832  		 * this case, we don't se=
t card->id to avoid collisions
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6833  		 * when running with mult=
iple cards.
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6834  		 */
da2ea374b28aa6 Markus Elfring 2017-08-12  6835  		if (!id[hdspm->dev] && hd=
spm->serial !=3D 0xFFFFFF) {
7ad210ace5c170 Arnd Bergmann  2017-07-18  6836  			snprintf(card->id, sizeo=
f(card->id),
7ad210ace5c170 Arnd Bergmann  2017-07-18  6837  				 "HDSPMx%06x", hdspm->s=
erial);
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6838  			snd_card_set_id(card, ca=
rd->id);
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6839  		}
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6840  	}
f7de8ba3fcf194 Adrian Knoth   2012-01-10  6841  =

e3a471d6680487 Takashi Iwai   2014-02-26  6842  	dev_dbg(card->dev, "create=
 alsa devices.\n");
ef5fa1a49fc3b5 Takashi Iwai   2007-07-27  6843  	err =3D snd_hdspm_create_a=
lsa_devices(card, hdspm);
ef5fa1a49fc3b5 Takashi Iwai   2007-07-27  6844  	if (err < 0)
763f356cd8de9e Takashi Iwai   2005-06-03  6845  		return err;
763f356cd8de9e Takashi Iwai   2005-06-03  6846  =

763f356cd8de9e Takashi Iwai   2005-06-03  6847  	snd_hdspm_initialize_midi_=
flush(hdspm);
763f356cd8de9e Takashi Iwai   2005-06-03  6848  =

763f356cd8de9e Takashi Iwai   2005-06-03  6849  	return 0;
763f356cd8de9e Takashi Iwai   2005-06-03  6850  }
763f356cd8de9e Takashi Iwai   2005-06-03  6851  =


:::::: The code@line 6589 was first introduced by commit
:::::: 763f356cd8de9e158836d236b3fd9dd149d696f9 [ALSA] Add HDSP MADI driver

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7750513385062744362==--

