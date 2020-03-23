Content-Type: multipart/mixed; boundary="===============7219524101176186462=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [jkirsher-next-queue:dev-queue 49/49] drivers/net/ethernet/intel/igc/igc_diag.c:161 igc_reg_test() error: uninitialized symbol 'b'.
Date: Mon, 23 Mar 2020 10:42:21 +0300
Message-ID: <20200323074221.GL4650@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7219524101176186462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue=
.git dev-queue
head:   a6017405fcd0cda0cd9f35b34cae92400cf9e3e3
commit: a6017405fcd0cda0cd9f35b34cae92400cf9e3e3 [49/49] igc: add support t=
o interrupt, eeprom, registers and link self-tests

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/intel/igc/igc_diag.c:161 igc_reg_test() error: uniniti=
alized symbol 'b'.

# https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git/c=
ommit/?id=3Da6017405fcd0cda0cd9f35b34cae92400cf9e3e3
git remote add jkirsher-next-queue https://git.kernel.org/pub/scm/linux/ker=
nel/git/jkirsher/next-queue.git
git remote update jkirsher-next-queue
git checkout a6017405fcd0cda0cd9f35b34cae92400cf9e3e3
vim +/b +161 drivers/net/ethernet/intel/igc/igc_diag.c

a6017405fcd0cd Vitaly Lifshits 2020-03-17   90  bool igc_reg_test(struct ig=
c_adapter *adapter, u64 *data)
a6017405fcd0cd Vitaly Lifshits 2020-03-17   91  {
a6017405fcd0cd Vitaly Lifshits 2020-03-17   92  	struct igc_reg_test *test =
=3D reg_test;
a6017405fcd0cd Vitaly Lifshits 2020-03-17   93  	struct igc_hw *hw =3D &ada=
pter->hw;
a6017405fcd0cd Vitaly Lifshits 2020-03-17   94  	u32 value, before, after;
a6017405fcd0cd Vitaly Lifshits 2020-03-17   95  	u32 i, toggle, b;
a6017405fcd0cd Vitaly Lifshits 2020-03-17   96  =

a6017405fcd0cd Vitaly Lifshits 2020-03-17   97  	if (IGC_REMOVED(hw->hw_add=
r)) {
a6017405fcd0cd Vitaly Lifshits 2020-03-17   98  		dev_err(&adapter->pdev->d=
ev, "Adapter removed - register test blocked\n");
a6017405fcd0cd Vitaly Lifshits 2020-03-17   99  		*data =3D 1;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  100  		return true;

This function returns true on failure and false on success?

a6017405fcd0cd Vitaly Lifshits 2020-03-17  101  	}
a6017405fcd0cd Vitaly Lifshits 2020-03-17  102  =

a6017405fcd0cd Vitaly Lifshits 2020-03-17  103  	/* Because the status regi=
ster is such a special case,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  104  	 * we handle it separately=
 from the rest of the register
a6017405fcd0cd Vitaly Lifshits 2020-03-17  105  	 * tests.  Some bits are r=
ead-only, some toggle, and some
a6017405fcd0cd Vitaly Lifshits 2020-03-17  106  	 * are writeable.
a6017405fcd0cd Vitaly Lifshits 2020-03-17  107  	 */
a6017405fcd0cd Vitaly Lifshits 2020-03-17  108  =

a6017405fcd0cd Vitaly Lifshits 2020-03-17  109  	toggle =3D 0x6800D3;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  110  	before =3D rd32(IGC_STATUS=
);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  111  	value =3D before & toggle;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  112  	wr32(IGC_STATUS, toggle);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  113  	after =3D rd32(IGC_STATUS)=
 & toggle;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  114  	if (value !=3D after) {
a6017405fcd0cd Vitaly Lifshits 2020-03-17  115  		dev_err(&adapter->pdev->d=
ev,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  116  			"failed STATUS register =
test got: 0x%08X expected: 0x%08X\n",
a6017405fcd0cd Vitaly Lifshits 2020-03-17  117  			after, value);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  118  		*data =3D 1;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  119  		return 1;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  120  	}
a6017405fcd0cd Vitaly Lifshits 2020-03-17  121  	/* restore previous status=
 */
a6017405fcd0cd Vitaly Lifshits 2020-03-17  122  	wr32(IGC_STATUS, before);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  123  =

a6017405fcd0cd Vitaly Lifshits 2020-03-17  124  	/* Perform the remainder o=
f the register test, looping through
a6017405fcd0cd Vitaly Lifshits 2020-03-17  125  	 * the test table until we=
 either fail or reach the null entry.
a6017405fcd0cd Vitaly Lifshits 2020-03-17  126  	 */
a6017405fcd0cd Vitaly Lifshits 2020-03-17  127  	while (test->reg) {
a6017405fcd0cd Vitaly Lifshits 2020-03-17  128  		for (i =3D 0; i < test->a=
rray_len; i++) {
a6017405fcd0cd Vitaly Lifshits 2020-03-17  129  			switch (test->test_type)=
 {
a6017405fcd0cd Vitaly Lifshits 2020-03-17  130  			case PATTERN_TEST:
a6017405fcd0cd Vitaly Lifshits 2020-03-17  131  				b =3D reg_pattern_test(=
adapter, data,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  132  						     test->reg + (i *=
 0x40),
a6017405fcd0cd Vitaly Lifshits 2020-03-17  133  						     test->mask,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  134  						     test->write);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  135  				break;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  136  			case SET_READ_TEST:
a6017405fcd0cd Vitaly Lifshits 2020-03-17  137  				b =3D reg_set_and_check=
(adapter, data,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  138  						      test->reg + (i =
* 0x40),
a6017405fcd0cd Vitaly Lifshits 2020-03-17  139  						      test->mask,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  140  						      test->write);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  141  				break;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  142  			case TABLE64_TEST_LO:
a6017405fcd0cd Vitaly Lifshits 2020-03-17  143  				b =3D reg_pattern_test(=
adapter, data,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  144  						     test->reg + (i *=
 8),
a6017405fcd0cd Vitaly Lifshits 2020-03-17  145  						     test->mask,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  146  						     test->write);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  147  				break;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  148  			case TABLE64_TEST_HI:
a6017405fcd0cd Vitaly Lifshits 2020-03-17  149  				b =3D reg_pattern_test(=
adapter, data,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  150  						     test->reg + 4 + =
(i * 8),
a6017405fcd0cd Vitaly Lifshits 2020-03-17  151  						     test->mask,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  152  						     test->write);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  153  				break;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  154  			case TABLE32_TEST:
a6017405fcd0cd Vitaly Lifshits 2020-03-17  155  				b =3D reg_pattern_test(=
adapter, data,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  156  						     test->reg + (i *=
 4),
a6017405fcd0cd Vitaly Lifshits 2020-03-17  157  						     test->mask,
a6017405fcd0cd Vitaly Lifshits 2020-03-17  158  						     test->write);
a6017405fcd0cd Vitaly Lifshits 2020-03-17  159  				break;

No default case.  Eventually GCC will fix its bug and start warning
about uninitialized variables again so you may as well fix it.

a6017405fcd0cd Vitaly Lifshits 2020-03-17  160  			}
a6017405fcd0cd Vitaly Lifshits 2020-03-17 @161  			if (b)
a6017405fcd0cd Vitaly Lifshits 2020-03-17  162  				return true;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  163  		}
a6017405fcd0cd Vitaly Lifshits 2020-03-17  164  		test++;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  165  	}
a6017405fcd0cd Vitaly Lifshits 2020-03-17  166  	*data =3D 0;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  167  	return false;
a6017405fcd0cd Vitaly Lifshits 2020-03-17  168  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7219524101176186462==--

