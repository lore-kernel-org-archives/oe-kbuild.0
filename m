Content-Type: multipart/mixed; boundary="===============1053640389795966052=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] Input: add support for Azoteq IQS7222A/B/C
Date: Tue, 05 Apr 2022 18:56:31 +0800
Message-ID: <202204051838.6Uj66mbG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1053640389795966052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220403221659.865997-3-jeff@labundy.com>
References: <20220403221659.865997-3-jeff@labundy.com>
TO: Jeff LaBundy <jeff@labundy.com>
TO: dmitry.torokhov(a)gmail.com
TO: robh+dt(a)kernel.org
CC: linux-input(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: Jeff LaBundy <jeff@labundy.com>

Hi Jeff,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on robh/for-next hid/for-next v5.18-rc1 next-20220=
405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-LaBundy/Add-sup=
port-for-Azoteq-IQS7222A-B-C/20220404-061950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-c003-20220405 (https://download.01.org/0day-ci/arch=
ive/20220405/202204051838.6Uj66mbG-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/iqs7222.c:2418:9-34: WARNING: Threaded IRQ with no pr=
imary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1053640389795966052==--

