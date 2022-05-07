Content-Type: multipart/mixed; boundary="===============5061314859669321061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 1/1] drm/vkms: Add basic support for ConfigFS to VKMS
Date: Sat, 07 May 2022 10:57:29 +0800
Message-ID: <202205071028.XcXAwiYq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5061314859669321061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220506001822.890772-2-jshargo@chromium.org>
References: <20220506001822.890772-2-jshargo@chromium.org>
TO: Jim Shargo <jshargo@chromium.org>

Hi Jim,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm/drm-next]
[also build test WARNING on v5.18-rc5 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Shargo/drm-vkms-=
ConfigFS-support/20220506-182056
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: mipsel-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e32fa3dd59fa0c63d6c7b007bddbc78a53cb40bc
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vkms/vkms_configfs.c:15:2: warning: %d in format string =
(no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPri=
ntfArgType_sint]
    snprintf(name, CONFIGFS_ITEM_NAME_LEN, "%d", id);
    ^

vim +15 drivers/gpu/drm/vkms/vkms_configfs.c

e32fa3dd59fa0c Jim Shargo 2022-05-06   8  =

e32fa3dd59fa0c Jim Shargo 2022-05-06   9  static void setup_configfs_object=
(uint32_t id, struct config_group *object,
e32fa3dd59fa0c Jim Shargo 2022-05-06  10  				  struct config_group *parent,
e32fa3dd59fa0c Jim Shargo 2022-05-06  11  				  struct config_item_type *ty=
pe)
e32fa3dd59fa0c Jim Shargo 2022-05-06  12  {
e32fa3dd59fa0c Jim Shargo 2022-05-06  13  	char name[CONFIGFS_ITEM_NAME_LEN=
];
e32fa3dd59fa0c Jim Shargo 2022-05-06  14  =

e32fa3dd59fa0c Jim Shargo 2022-05-06 @15  	snprintf(name, CONFIGFS_ITEM_NAM=
E_LEN, "%d", id);
e32fa3dd59fa0c Jim Shargo 2022-05-06  16  	config_group_init_type_name(obje=
ct, name, type);
e32fa3dd59fa0c Jim Shargo 2022-05-06  17  	configfs_add_default_group(objec=
t, parent);
e32fa3dd59fa0c Jim Shargo 2022-05-06  18  }
e32fa3dd59fa0c Jim Shargo 2022-05-06  19  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5061314859669321061==--

