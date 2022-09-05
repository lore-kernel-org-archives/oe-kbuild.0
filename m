Content-Type: multipart/mixed; boundary="===============4317383428447580585=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vbabka-slab:for-6.1/common_kmalloc 6/17] drivers/usb/core/config.c:522:26: warning: use of uninitialized value '*inums_61(D) + i.40_7' [CWE-457]
Date: Tue, 06 Sep 2022 04:52:08 +0800
Message-ID: <202209060409.lILTSw7Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4317383428447580585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/usb/core/config.c:522:26: warning: use of uninitialized value '*in=
ums_61(D) + i.40_7' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-mm(a)kvack.org
TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-6=
.1/common_kmalloc
head:   d5eff736902d5565a24f1b571b5987b3e5ee9a5b
commit: e4c98d68959e51646c379e157bad36ef0d7bf467 [6/17] mm/slab_common: fol=
d kmalloc_order_trace() into kmalloc_large()
:::::: branch date: 4 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-c002-20220905 (https://download.01.org/0day-ci/archi=
ve/20220906/202209060409.lILTSw7Y-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/c=
ommit/?id=3De4c98d68959e51646c379e157bad36ef0d7bf467
        git remote add vbabka-slab git://git.kernel.org/pub/scm/linux/kerne=
l/git/vbabka/slab.git
        git fetch --no-tags vbabka-slab for-6.1/common_kmalloc
        git checkout e4c98d68959e51646c379e157bad36ef0d7bf467
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In function 'usb_get_configuration':
   cc1: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyz=
er-use-of-uninitialized-value]
     'usb_get_configuration': events 1-9
       |
       |drivers/usb/core/config.c:870:12:
       |  870 |         if (ncfg > USB_MAXCONFIG) {
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'ncfg <=3D 8'=
)...
       |......
       |  876 |         if (ncfg < 1) {
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (3) following 'false' branch (when 'ncfg !=3D 0'=
)...
       |      |         (2) ...to here
       |......
       |  881 |         length =3D ncfg * sizeof(struct usb_host_config);
       |      |         ~~~~~~
       |      |         |
       |      |         (4) ...to here
       |  882 |         dev->config =3D kzalloc(length, GFP_KERNEL);
       |  883 |         if (!dev->config)
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch...
       |......
       |  886 |         length =3D ncfg * sizeof(char *);
       |      |         ~~~~~~
       |      |         |
       |      |         (6) ...to here
       |  887 |         dev->rawdescriptors =3D kzalloc(length, GFP_KERNEL);
       |  888 |         if (!dev->rawdescriptors)
       |      |            ~
       |      |            |
       |      |            (7) following 'false' branch...
       |......
       |  891 |         desc =3D kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
       |      |         ~~~~
       |      |         |
       |      |         (8) ...to here
       |  892 |         if (!desc)
       |      |            ~
       |      |            |
       |      |            (9) following 'false' branch (when 'ret' is non-=
NULL)...
       |
     'usb_get_configuration': event 10
       |
       |cc1:
       | (10): ...to here
       |
     'usb_get_configuration': events 11-12
       |
       |  895 |         for (cfgno =3D 0; cfgno < ncfg; cfgno++) {
       |      |                         ~~~~~~^~~~~~
       |      |                               |
       |      |                               (11) following 'false' branch=
...
       |......
       |  952 | err:
       |      | ~~~                            =

       |      | |
       |      | (12) ...to here
       |
     'usb_get_configuration': event 13
       |
       |cc1:
       | (13): use of uninitialized value '=1B[01m=1B[K<unknown>=1B[m=1B[K'=
 here
       |
   drivers/usb/core/config.c: In function 'usb_parse_interface':
>> drivers/usb/core/config.c:522:26: warning: use of uninitialized value '*=
inums_61(D) + i.40_7' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     522 |                 if (inums[i] =3D=3D inum) {
         |                     ~~~~~^~~
     'usb_get_configuration': events 1-10
       |
       |  861 | int usb_get_configuration(struct usb_device *dev)
       |      |     ^~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'usb_get_configuration'
       |......
       |  870 |         if (ncfg > USB_MAXCONFIG) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ncfg <=3D 8'=
)...
       |......
       |  876 |         if (ncfg < 1) {
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (4) following 'false' branch (when 'ncfg !=3D 0'=
)...
       |      |         (3) ...to here
       |......
       |  881 |         length =3D ncfg * sizeof(struct usb_host_config);
       |      |         ~~~~~~
       |      |         |
       |      |         (5) ...to here
       |  882 |         dev->config =3D kzalloc(length, GFP_KERNEL);
       |  883 |         if (!dev->config)
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch...
       |......
       |  886 |         length =3D ncfg * sizeof(char *);
       |      |         ~~~~~~
       |      |         |
       |      |         (7) ...to here
       |  887 |         dev->rawdescriptors =3D kzalloc(length, GFP_KERNEL);
       |  888 |         if (!dev->rawdescriptors)
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       |  891 |         desc =3D kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
       |      |         ~~~~
       |      |         |
       |      |         (9) ...to here
       |  892 |         if (!desc)
       |      |            ~
       |      |            |
       |      |            (10) following 'false' branch (when 'ret' is non=
-NULL)...
       |
     'usb_get_configuration': event 11
       |
       |cc1:
       | (11): ...to here
       |
     'usb_get_configuration': events 12-24
       |
       |  895 |         for (cfgno =3D 0; cfgno < ncfg; cfgno++) {
       |      |                         ~~~~~~^~~~~~
       |      |                               |
       |      |                               (12) following 'true' branch.=
..
       |......
       |  898 |                 result =3D usb_get_descriptor(dev, USB_DT_C=
ONFIG, cfgno,
       |      |                 ~~~~~~         =

       |      |                 |
       |      |                 (13) ...to here
       |  899 |                     desc, USB_DT_CONFIG_SIZE);
       |  900 |                 if (result < 0) {
       |      |                    ~           =

       |      |                    |
       |      |                    (14) following 'false' branch (when 'res=
ult >=3D 0')...
       |......
       |  908 |                 } else if (result < 4) {
       |      |                        ~~ ~    =

       |      |                        |  |
       |      |                        |  (16) following 'false' branch (wh=
en 'result > 3')...
       |      |                        (15) ...to here
       |......
       |  915 |                 length =3D max((int) le16_to_cpu(desc->wTot=
alLength),
       |      |                 ~~~~~~         =

       |      |                 |
       |      |                 (17) ...to here
       |......
       |  920 |                 if (!bigbuffer) {
       |      |                    ~           =

       |      |                    |
       |      |                    (18) following 'false' branch...
       |......
       |  925 |                 if (dev->quirks & USB_QUIRK_DELAY_INIT)
       |      |                 ~~             =

       |      |                 |
       |      |                 (19) ...to here
       |......
       |  930 |                 if (result < 0) {
       |      |                    ~           =

       |      |                    |
       |      |                    (20) following 'false' branch (when 'res=
ult >=3D 0')...
       |......
       |  936 |                 if (result < length) {
       |      |                 ~~ ~           =

       |      |                 |  |
--
       |  945 |                     &dev->config[cfgno], bigbuffer, length);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'usb_parse_configuration': events 25-28
              |
              |  605 | static int usb_parse_configuration(struct usb_device=
 *dev, int cfgidx,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (25) entry to 'usb_parse_configuration'
              |......
              |  618 |         u8 inums[USB_MAXINTERFACES], nalts[USB_MAXIN=
TERFACES];
              |      |            ~~~~~
              |      |            |
              |      |            (26) region created on stack here
              |......
              |  625 |         if (config->desc.bDescriptorType !=3D USB_DT=
_CONFIG ||
              |      |            ~
              |      |            |
              |      |            (27) following 'false' branch...
              |  626 |             config->desc.bLength < USB_DT_CONFIG_SIZ=
E ||
              |      |             ~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (28) ...to here
              |
            'usb_parse_configuration': events 29-33
              |
              |  625 |         if (config->desc.bDescriptorType !=3D USB_DT=
_CONFIG ||
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
              |  626 |             config->desc.bLength < USB_DT_CONFIG_SIZ=
E ||
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~   =

              |      |                                                     =
  |
              |      |                                                     =
  (31) following 'false' branch...
              |  627 |             config->desc.bLength > size) {
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~             =
       =

              |      |                         |
              |      |                         (30) ...to here
              |......
              |  633 |         cfgno =3D config->desc.bConfigurationValue;
              |      |         ~~~~~                                       =
       =

              |      |         |
              |      |         (32) ...to here
              |......
              |  784 |         i =3D find_next_descriptor(buffer, size, USB=
_DT_INTERFACE,
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
              |      |             |
              |      |             (33) calling 'find_next_descriptor' from=
 'usb_parse_configuration'
              |  785 |             USB_DT_INTERFACE, &n);
              |      |             ~~~~~~~~~~~~~~~~~~~~~                   =
       =

              |
              +--> 'find_next_descriptor': events 34-36
                     |
                     |   27 | static int find_next_descriptor(unsigned char=
 *buffer, int size,
                     |      |            ^~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (34) entry to 'find_next_descripto=
r'
                     |......
                     |   46 |         if (num_skipped)
                     |      |            ~
                     |      |            |
                     |      |            (35) following 'true' branch (when=
 'num_skipped' is non-NULL)...
                     |   47 |                 *num_skipped =3D n;
                     |      |                 ~
                     |      |                 |
                     |      |                 (36) ...to here
                     |
              <------+
              |
            'usb_parse_configuration': events 37-40
              |
              |  784 |         i =3D find_next_descriptor(buffer, size, USB=
_DT_INTERFACE,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
              |      |             |
              |      |             (37) returning to 'usb_parse_configurati=
on' from 'find_next_descriptor'
              |  785 |             USB_DT_INTERFACE, &n);
              |      |             ~~~~~~~~~~~~~~~~~~~~~
              |......
              |  794 |         while (size > 0) {
              |      |                ~~~~~~~~
              |      |                     |
              |      |                     (38) following 'true' branch (wh=
en 'size > 0')...
              |  795 |                 retval =3D usb_parse_interface(ddev,=
 cfgno, config,
              |      |                 ~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
              |      |                 |        |
              |      |                 |        (40) calling 'usb_parse_int=
erface' from 'usb_parse_configuration'
              |      |                 (39) ...to here
              |  796 |                     buffer, size, inums, nalts);
              |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'usb_parse_interface': events 41-42
                     |
                     |  498 | static int usb_parse_interface(struct device =
*ddev, int cfgno,
                     |      |            ^~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (41) entry to 'usb_parse_interface'
                     |......
                     |  522 |                 if (inums[i] =3D=3D inum) {
                     |      |                     ~~~~~~~~
                     |      |                          |
                     |      |                          (42) use of uninitia=
lized value '*inums_61(D) + i.40_7' here
                     |
>> drivers/usb/core/config.c:522:26: warning: use of uninitialized value '*=
inums_61(D) + i.40_7' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     522 |                 if (inums[i] =3D=3D inum) {
         |                     ~~~~~^~~
     'usb_get_configuration': events 1-10
       |
       |  861 | int usb_get_configuration(struct usb_device *dev)
       |      |     ^~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'usb_get_configuration'
       |......
       |  870 |         if (ncfg > USB_MAXCONFIG) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ncfg <=3D 8'=
)...
       |......
       |  876 |         if (ncfg < 1) {
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (4) following 'false' branch (when 'ncfg !=3D 0'=
)...
       |      |         (3) ...to here
       |......
       |  881 |         length =3D ncfg * sizeof(struct usb_host_config);
       |      |         ~~~~~~
       |      |         |
       |      |         (5) ...to here
       |  882 |         dev->config =3D kzalloc(length, GFP_KERNEL);
       |  883 |         if (!dev->config)
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch...
       |......
       |  886 |         length =3D ncfg * sizeof(char *);
       |      |         ~~~~~~
       |      |         |
       |      |         (7) ...to here
       |  887 |         dev->rawdescriptors =3D kzalloc(length, GFP_KERNEL);
       |  888 |         if (!dev->rawdescriptors)
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       |  891 |         desc =3D kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
       |      |         ~~~~
       |      |         |
       |      |         (9) ...to here
       |  892 |         if (!desc)
       |      |            ~
       |      |            |
       |      |            (10) following 'false' branch (when 'ret' is non=
-NULL)...
       |
     'usb_get_configuration': event 11
       |
       |cc1:
       | (11): ...to here
       |
     'usb_get_configuration': events 12-24
       |
       |  895 |         for (cfgno =3D 0; cfgno < ncfg; cfgno++) {
       |      |                         ~~~~~~^~~~~~
       |      |                               |
       |      |                               (12) following 'true' branch.=
..
       |......
       |  898 |                 result =3D usb_get_descriptor(dev, USB_DT_C=
ONFIG, cfgno,
       |      |                 ~~~~~~         =

       |      |                 |
       |      |                 (13) ...to here
       |  899 |                     desc, USB_DT_CONFIG_SIZE);
       |  900 |                 if (result < 0) {
       |      |                    ~           =

       |      |                    |
       |      |                    (14) following 'false' branch (when 'res=
ult >=3D 0')...
       |......
       |  908 |                 } else if (result < 4) {
       |      |                        ~~ ~    =

       |      |                        |  |
       |      |                        |  (16) following 'false' branch (wh=
en 'result > 3')...
       |      |                        (15) ...to here
       |......
       |  915 |                 length =3D max((int) le16_to_cpu(desc->wTot=
alLength),
       |      |                 ~~~~~~         =

       |      |                 |
       |      |                 (17) ...to here
       |......
       |  920 |                 if (!bigbuffer) {
       |      |                    ~           =

       |      |                    |
       |      |                    (18) following 'false' branch...
       |......
       |  925 |                 if (dev->quirks & USB_QUIRK_DELAY_INIT)
       |      |                 ~~             =

       |      |                 |
       |      |                 (19) ...to here
       |......
       |  930 |                 if (result < 0) {
       |      |                    ~           =

       |      |                    |
       |      |                    (20) following 'false' branch (when 'res=
ult >=3D 0')...
       |......
       |  936 |                 if (result < length) {
       |      |                 ~~ ~           =

       |      |                 |  |

vim +522 drivers/usb/core/config.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  497  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  498  static int usb_parse_int=
erface(struct device *ddev, int cfgno,
^1da177e4c3f41 Linus Torvalds     2005-04-16  499      struct usb_host_conf=
ig *config, unsigned char *buffer, int size,
^1da177e4c3f41 Linus Torvalds     2005-04-16  500      u8 inums[], u8 nalts=
[])
^1da177e4c3f41 Linus Torvalds     2005-04-16  501  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  502  	unsigned char *buffer0 =
=3D buffer;
^1da177e4c3f41 Linus Torvalds     2005-04-16  503  	struct usb_interface_de=
scriptor	*d;
^1da177e4c3f41 Linus Torvalds     2005-04-16  504  	int inum, asnum;
^1da177e4c3f41 Linus Torvalds     2005-04-16  505  	struct usb_interface_ca=
che *intfc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  506  	struct usb_host_interfa=
ce *alt;
^1da177e4c3f41 Linus Torvalds     2005-04-16  507  	int i, n;
^1da177e4c3f41 Linus Torvalds     2005-04-16  508  	int len, retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  509  	int num_ep, num_ep_orig;
^1da177e4c3f41 Linus Torvalds     2005-04-16  510  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  511  	d =3D (struct usb_inter=
face_descriptor *) buffer;
^1da177e4c3f41 Linus Torvalds     2005-04-16  512  	buffer +=3D d->bLength;
^1da177e4c3f41 Linus Torvalds     2005-04-16  513  	size -=3D d->bLength;
^1da177e4c3f41 Linus Torvalds     2005-04-16  514  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  515  	if (d->bLength < USB_DT=
_INTERFACE_SIZE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  516  		goto skip_to_next_inte=
rface_descriptor;
^1da177e4c3f41 Linus Torvalds     2005-04-16  517  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  518  	/* Which interface entr=
y is this? */
^1da177e4c3f41 Linus Torvalds     2005-04-16  519  	intfc =3D NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  520  	inum =3D d->bInterfaceN=
umber;
^1da177e4c3f41 Linus Torvalds     2005-04-16  521  	for (i =3D 0; i < confi=
g->desc.bNumInterfaces; ++i) {
^1da177e4c3f41 Linus Torvalds     2005-04-16 @522  		if (inums[i] =3D=3D in=
um) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  523  			intfc =3D config->int=
f_cache[i];
^1da177e4c3f41 Linus Torvalds     2005-04-16  524  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  525  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  526  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  527  	if (!intfc || intfc->nu=
m_altsetting >=3D nalts[i])
^1da177e4c3f41 Linus Torvalds     2005-04-16  528  		goto skip_to_next_inte=
rface_descriptor;
^1da177e4c3f41 Linus Torvalds     2005-04-16  529  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  530  	/* Check for duplicate =
altsetting entries */
^1da177e4c3f41 Linus Torvalds     2005-04-16  531  	asnum =3D d->bAlternate=
Setting;
^1da177e4c3f41 Linus Torvalds     2005-04-16  532  	for ((i =3D 0, alt =3D =
&intfc->altsetting[0]);
^1da177e4c3f41 Linus Torvalds     2005-04-16  533  	      i < intfc->num_al=
tsetting;
^1da177e4c3f41 Linus Torvalds     2005-04-16  534  	     (++i, ++alt)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  535  		if (alt->desc.bAlterna=
teSetting =3D=3D asnum) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  536  			dev_warn(ddev, "Dupli=
cate descriptor for config %d "
^1da177e4c3f41 Linus Torvalds     2005-04-16  537  			    "interface %d alt=
setting %d, skipping\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  538  			    cfgno, inum, asnu=
m);
^1da177e4c3f41 Linus Torvalds     2005-04-16  539  			goto skip_to_next_int=
erface_descriptor;
^1da177e4c3f41 Linus Torvalds     2005-04-16  540  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  541  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  542  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  543  	++intfc->num_altsetting;
^1da177e4c3f41 Linus Torvalds     2005-04-16  544  	memcpy(&alt->desc, d, U=
SB_DT_INTERFACE_SIZE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  545  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  546  	/* Skip over any Class =
Specific or Vendor Specific descriptors;
^1da177e4c3f41 Linus Torvalds     2005-04-16  547  	 * find the first endpo=
int or interface descriptor */
^1da177e4c3f41 Linus Torvalds     2005-04-16  548  	alt->extra =3D buffer;
^1da177e4c3f41 Linus Torvalds     2005-04-16  549  	i =3D find_next_descrip=
tor(buffer, size, USB_DT_ENDPOINT,
^1da177e4c3f41 Linus Torvalds     2005-04-16  550  	    USB_DT_INTERFACE, &=
n);
^1da177e4c3f41 Linus Torvalds     2005-04-16  551  	alt->extralen =3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  552  	if (n > 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  553  		dev_dbg(ddev, "skipped=
 %d descriptor%s after %s\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  554  		    n, plural(n), "int=
erface");
^1da177e4c3f41 Linus Torvalds     2005-04-16  555  	buffer +=3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  556  	size -=3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  557  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  558  	/* Allocate space for t=
he right(?) number of endpoints */
^1da177e4c3f41 Linus Torvalds     2005-04-16  559  	num_ep =3D num_ep_orig =
=3D alt->desc.bNumEndpoints;
2c044a48038047 Greg Kroah-Hartman 2008-01-30  560  	alt->desc.bNumEndpoints=
 =3D 0;		/* Use as a counter */
^1da177e4c3f41 Linus Torvalds     2005-04-16  561  	if (num_ep > USB_MAXEND=
POINTS) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  562  		dev_warn(ddev, "too ma=
ny endpoints for config %d interface %d "
^1da177e4c3f41 Linus Torvalds     2005-04-16  563  		    "altsetting %d: %d=
, using maximum allowed: %d\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  564  		    cfgno, inum, asnum=
, num_ep, USB_MAXENDPOINTS);
^1da177e4c3f41 Linus Torvalds     2005-04-16  565  		num_ep =3D USB_MAXENDP=
OINTS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  566  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  567  =

2c044a48038047 Greg Kroah-Hartman 2008-01-30  568  	if (num_ep > 0) {
2c044a48038047 Greg Kroah-Hartman 2008-01-30  569  		/* Can't allocate 0 by=
tes */
^1da177e4c3f41 Linus Torvalds     2005-04-16  570  		len =3D sizeof(struct =
usb_host_endpoint) * num_ep;
0a1ef3b5a765a6 Alan Stern         2005-10-24  571  		alt->endpoint =3D kzal=
loc(len, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  572  		if (!alt->endpoint)
^1da177e4c3f41 Linus Torvalds     2005-04-16  573  			return -ENOMEM;
57a21c1b929450 Alan Stern         2007-05-15  574  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  575  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  576  	/* Parse all the endpoi=
nt descriptors */
^1da177e4c3f41 Linus Torvalds     2005-04-16  577  	n =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  578  	while (size > 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  579  		if (((struct usb_descr=
iptor_header *) buffer)->bDescriptorType
^1da177e4c3f41 Linus Torvalds     2005-04-16  580  		     =3D=3D USB_DT_INT=
ERFACE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  581  			break;
3e4f8e21c4f27b Johan Hovold       2019-12-19  582  		retval =3D usb_parse_e=
ndpoint(ddev, cfgno, config, inum, asnum,
3e4f8e21c4f27b Johan Hovold       2019-12-19  583  				alt, num_ep, buffer,=
 size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  584  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  585  			return retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  586  		++n;
^1da177e4c3f41 Linus Torvalds     2005-04-16  587  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  588  		buffer +=3D retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  589  		size -=3D retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  590  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  591  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  592  	if (n !=3D num_ep_orig)
^1da177e4c3f41 Linus Torvalds     2005-04-16  593  		dev_warn(ddev, "config=
 %d interface %d altsetting %d has %d "
^1da177e4c3f41 Linus Torvalds     2005-04-16  594  		    "endpoint descript=
or%s, different from the interface "
^1da177e4c3f41 Linus Torvalds     2005-04-16  595  		    "descriptor's valu=
e: %d\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  596  		    cfgno, inum, asnum=
, n, plural(n), num_ep_orig);
^1da177e4c3f41 Linus Torvalds     2005-04-16  597  	return buffer - buffer0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  598  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  599  skip_to_next_interface_d=
escriptor:
^1da177e4c3f41 Linus Torvalds     2005-04-16  600  	i =3D find_next_descrip=
tor(buffer, size, USB_DT_INTERFACE,
^1da177e4c3f41 Linus Torvalds     2005-04-16  601  	    USB_DT_INTERFACE, N=
ULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  602  	return buffer - buffer0=
 + i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  603  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  604  =


:::::: The code@line 522 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4317383428447580585==--

