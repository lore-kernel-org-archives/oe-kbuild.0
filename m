Content-Type: multipart/mixed; boundary="===============0108874346193871337=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/hexdump.c:50 hex_to_bin() warn: shift has higher precedence than mask
Date: Wed, 27 Apr 2022 00:43:32 +0800
Message-ID: <202204270058.nS3U9AEC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0108874346193871337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mikulas Patocka <mpatocka@redhat.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220425-2008=
06/Mikulas-Patocka/hex2bin-make-the-function-hex_to_bin-constant-time/20220=
425-045651
head:   1270242e9a05bb4547ff4c65b0ff2eef25ac9bf3
commit: 1270242e9a05bb4547ff4c65b0ff2eef25ac9bf3 hex2bin: make the function=
 hex_to_bin constant-time
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-m001-20220425 (https://download.01.org/0day-ci/ar=
chive/20220427/202204270058.nS3U9AEC-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
lib/hexdump.c:50 hex_to_bin() warn: shift has higher precedence than mask

Old smatch warnings:
lib/hexdump.c:51 hex_to_bin() warn: shift has higher precedence than mask

vim +50 lib/hexdump.c

3fc957721d18c9 Harvey Harrison 2008-05-14  18  =

903788892ea0fc Andy Shevchenko 2010-05-24  19  /**
903788892ea0fc Andy Shevchenko 2010-05-24  20   * hex_to_bin - convert a he=
x digit to its real value
903788892ea0fc Andy Shevchenko 2010-05-24  21   * @ch: ascii character repr=
esents hex digit
903788892ea0fc Andy Shevchenko 2010-05-24  22   *
903788892ea0fc Andy Shevchenko 2010-05-24  23   * hex_to_bin() converts one=
 hex digit to its actual value or -1 in case of bad
903788892ea0fc Andy Shevchenko 2010-05-24  24   * input.
1270242e9a05bb Mikulas Patocka 2022-04-25  25   *
1270242e9a05bb Mikulas Patocka 2022-04-25  26   * This function is used to =
load cryptographic keys, so it is coded in such a
1270242e9a05bb Mikulas Patocka 2022-04-25  27   * way that there are no con=
ditions or memory accesses that depend on data.
1270242e9a05bb Mikulas Patocka 2022-04-25  28   *
1270242e9a05bb Mikulas Patocka 2022-04-25  29   * Explanation of the logic:
1270242e9a05bb Mikulas Patocka 2022-04-25  30   * (ch - '9' - 1) is negativ=
e if ch <=3D '9'
1270242e9a05bb Mikulas Patocka 2022-04-25  31   * ('0' - 1 - ch) is negativ=
e if ch >=3D '0'
1270242e9a05bb Mikulas Patocka 2022-04-25  32   * we "and" these two values=
, so the result is negative if ch is in the range
1270242e9a05bb Mikulas Patocka 2022-04-25  33   *	'0' ... '9'
1270242e9a05bb Mikulas Patocka 2022-04-25  34   * we are only interested in=
 the sign, so we do a shift ">> 8"; note that right
1270242e9a05bb Mikulas Patocka 2022-04-25  35   *	shift of a negative value=
 is implementation-defined, so we cast the
1270242e9a05bb Mikulas Patocka 2022-04-25  36   *	value to (unsigned) befor=
e the shift --- we have 0xffffff if ch is in
1270242e9a05bb Mikulas Patocka 2022-04-25  37   *	the range '0' ... '9', 0 =
otherwise
1270242e9a05bb Mikulas Patocka 2022-04-25  38   * we "and" this value with =
(ch - '0' + 1) --- we have a value 1 ... 10 if ch is
1270242e9a05bb Mikulas Patocka 2022-04-25  39   *	in the range '0' ... '9',=
 0 otherwise
1270242e9a05bb Mikulas Patocka 2022-04-25  40   * we add this value to -1 -=
-- we have a value 0 ... 9 if ch is in the range '0'
1270242e9a05bb Mikulas Patocka 2022-04-25  41   *	... '9', -1 otherwise
1270242e9a05bb Mikulas Patocka 2022-04-25  42   * the next line is similar =
to the previous one, but we need to decode both
1270242e9a05bb Mikulas Patocka 2022-04-25  43   *	uppercase and lowercase l=
etters, so we use (ch & 0xdf), which converts
1270242e9a05bb Mikulas Patocka 2022-04-25  44   *	lowercase to uppercase
903788892ea0fc Andy Shevchenko 2010-05-24  45   */
1270242e9a05bb Mikulas Patocka 2022-04-25  46  int hex_to_bin(unsigned char=
 ch)
903788892ea0fc Andy Shevchenko 2010-05-24  47  {
1270242e9a05bb Mikulas Patocka 2022-04-25  48  	unsigned char cu =3D ch & 0=
xdf;
1270242e9a05bb Mikulas Patocka 2022-04-25  49  	return -1 +
1270242e9a05bb Mikulas Patocka 2022-04-25 @50  		((ch - '0' +  1) & (unsign=
ed)((ch - '9' - 1) & ('0' - 1 - ch)) >> 8) +
1270242e9a05bb Mikulas Patocka 2022-04-25  51  		((cu - 'A' + 11) & (unsign=
ed)((cu - 'F' - 1) & ('A' - 1 - cu)) >> 8);
903788892ea0fc Andy Shevchenko 2010-05-24  52  }
903788892ea0fc Andy Shevchenko 2010-05-24  53  EXPORT_SYMBOL(hex_to_bin);
903788892ea0fc Andy Shevchenko 2010-05-24  54  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0108874346193871337==--

