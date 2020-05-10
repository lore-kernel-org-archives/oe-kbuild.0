Content-Type: multipart/mixed; boundary="===============8998640383864025587=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v5 6/7] misc: bcm-vk: add Broadcom VK driver
Date: Sun, 10 May 2020 21:16:50 +0800
Message-ID: <202005102117.7ZsHBH73%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8998640383864025587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200508002739.19360-7-scott.branden@broadcom.com>
References: <20200508002739.19360-7-scott.branden@broadcom.com>
TO: Scott Branden <scott.branden@broadcom.com>
TO: Luis Chamberlain <mcgrof@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: David Brown <david.brown@linaro.org>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: bjorn.andersson(a)linaro.org
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: "Rafael J . Wysocki" <rafael@kernel.org>
CC: linux-kernel(a)vger.kernel.org
CC: linux-arm-msm(a)vger.kernel.org
CC: linux-fsdevel(a)vger.kernel.org
CC: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
CC: Olof Johansson <olof@lixom.net>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Dan Carpenter <error27@gmail.com>

Hi Scott,

I love your patch! Perhaps something to improve:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on next-20200508]
[cannot apply to char-misc/char-misc-testing kselftest/next linus/master v5=
.7-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Scott-Branden/firmware-add=
-partial-read-support-in-request_firmware_into_buf/20200509-014010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git c78c31b374a68be79cb4a03ef5b6c187f034e903
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/bcm-vk/bcm_vk_tty.c:25:11: warning: struct member 'bcm_vk_t=
ty_chan::reserved' is never used. [unusedStructMember]
    uint32_t reserved;
             ^
>> drivers/misc/bcm-vk/bcm_vk_tty.c:26:11: warning: struct member 'bcm_vk_t=
ty_chan::size' is never used. [unusedStructMember]
    uint32_t size;
             ^
>> drivers/misc/bcm-vk/bcm_vk_tty.c:29:12: warning: struct member 'bcm_vk_t=
ty_chan::data' is never used. [unusedStructMember]
    uint32_t *data;
              ^
>> drivers/misc/bcm-vk/bcm_vk_tty.c:27:11: warning: struct member 'bcm_vk_t=
ty_chan::wr' is never used. [unusedStructMember]
    uint32_t wr;
             ^
>> drivers/misc/bcm-vk/bcm_vk_tty.c:28:11: warning: struct member 'bcm_vk_t=
ty_chan::rd' is never used. [unusedStructMember]
    uint32_t rd;
             ^

# https://github.com/0day-ci/linux/commit/9bfeb5e906a38c71951818648941d7b10=
8c727e3
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 9bfeb5e906a38c71951818648941d7b108c727e3
vim +25 drivers/misc/bcm-vk/bcm_vk_tty.c

9bfeb5e906a38c Scott Branden 2020-05-07  11  =

9bfeb5e906a38c Scott Branden 2020-05-07  12  /* TTYVK base offset is 0x3000=
0 into BAR1 */
9bfeb5e906a38c Scott Branden 2020-05-07  13  #define BAR1_TTYVK_BASE_OFFSET=
	0x300000
9bfeb5e906a38c Scott Branden 2020-05-07  14  /* Each TTYVK channel (TO or F=
ROM) is 0x10000 */
9bfeb5e906a38c Scott Branden 2020-05-07  15  #define BAR1_TTYVK_CHAN_OFFSET=
	0x100000
9bfeb5e906a38c Scott Branden 2020-05-07  16  /* Each TTYVK channel has TO a=
nd FROM, hence the * 2 */
9bfeb5e906a38c Scott Branden 2020-05-07  17  #define BAR1_TTYVK_BASE(index)=
	(BAR1_TTYVK_BASE_OFFSET + \
9bfeb5e906a38c Scott Branden 2020-05-07  18  				 ((index) * BAR1_TTYVK_CHA=
N_OFFSET * 2))
9bfeb5e906a38c Scott Branden 2020-05-07  19  /* TO TTYVK channel base comes=
 before FROM for each index */
9bfeb5e906a38c Scott Branden 2020-05-07  20  #define TO_TTYK_BASE(index)	BA=
R1_TTYVK_BASE(index)
9bfeb5e906a38c Scott Branden 2020-05-07  21  #define FROM_TTYK_BASE(index)	=
(BAR1_TTYVK_BASE(index) + \
9bfeb5e906a38c Scott Branden 2020-05-07  22  				 BAR1_TTYVK_CHAN_OFFSET)
9bfeb5e906a38c Scott Branden 2020-05-07  23  =

9bfeb5e906a38c Scott Branden 2020-05-07  24  struct bcm_vk_tty_chan {
9bfeb5e906a38c Scott Branden 2020-05-07 @25  	uint32_t reserved;
9bfeb5e906a38c Scott Branden 2020-05-07 @26  	uint32_t size;
9bfeb5e906a38c Scott Branden 2020-05-07 @27  	uint32_t wr;
9bfeb5e906a38c Scott Branden 2020-05-07 @28  	uint32_t rd;
9bfeb5e906a38c Scott Branden 2020-05-07 @29  	uint32_t *data;
9bfeb5e906a38c Scott Branden 2020-05-07  30  };
9bfeb5e906a38c Scott Branden 2020-05-07  31  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8998640383864025587==--

