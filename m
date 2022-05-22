Content-Type: multipart/mixed; boundary="===============8824172208035303706=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC 2/2] usb: dwc3: Refactor PHY logic to support Multiport Controller
Date: Sun, 22 May 2022 11:41:28 +0800
Message-ID: <202205221139.tP4hE1f1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8824172208035303706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1652963695-10109-3-git-send-email-quic_harshq@quicinc.com>
References: <1652963695-10109-3-git-send-email-quic_harshq@quicinc.com>
TO: Harsh Agarwal <quic_harshq@quicinc.com>

Hi Harsh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on usb/usb-testing]
[also build test WARNING on next-20220520]
[cannot apply to robh/for-next balbi-usb/testing/next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Harsh-Agarwal/Add-su=
pport-for-multiport-controller/20220519-203742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
522/202205221139.tP4hE1f1-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/usb/dwc3/core.c:1386:2-34: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before return around line 1398.
   drivers/usb/dwc3/core.c:1386:2-34: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before return around line 1407.
   drivers/usb/dwc3/core.c:1386:2-34: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before return around line 1416.
   drivers/usb/dwc3/core.c:1386:2-34: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before return around line 1426.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8824172208035303706==--

