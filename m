Content-Type: multipart/mixed; boundary="===============7947751640307292343=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/2] lib/string_helpers: Introduce tokenize_user_input()
Date: Sat, 03 Sep 2022 04:28:24 +0800
Message-ID: <202209030411.0HeReNTd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7947751640307292343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: lib/strin=
g_helpers.c:150:20: warning: use of uninitialized value '<unknown>' [CWE-45=
7] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220901175022.334824-2-cezary.rojewski@intel.com>
References: <20220901175022.334824-2-cezary.rojewski@intel.com>
TO: Cezary Rojewski <cezary.rojewski@intel.com>
TO: alsa-devel(a)alsa-project.org
TO: broonie(a)kernel.org
CC: andy(a)kernel.org
CC: Cezary Rojewski <cezary.rojewski@intel.com>
CC: kai.vehmanen(a)linux.intel.com
CC: yung-chuan.liao(a)linux.intel.com
CC: tiwai(a)suse.com
CC: pierre-louis.bossart(a)linux.intel.com
CC: willy(a)infradead.org
CC: lgirdwood(a)gmail.com
CC: hdegoede(a)redhat.com
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: ranjani.sridharan(a)linux.intel.com
CC: amadeuszx.slawinski(a)linux.intel.com
CC: peter.ujfalusi(a)linux.intel.com
CC: linux-kernel(a)vger.kernel.org

Hi Cezary,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/lib-=
string_helpers-Introduce-tokenize_user_input/20220902-014254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-c002-20220901 (https://download.01.org/0day-ci/archi=
ve/20220903/202209030411.0HeReNTd-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/53e2025c60da991b4e8=
79aaf336a6635c0b87b07
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cezary-Rojewski/lib-string_helpers=
-Introduce-tokenize_user_input/20220902-014254
        git checkout 53e2025c60da991b4e879aaf336a6635c0b87b07
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   lib/string_helpers.c: In function 'tokenize_user_input':
>> lib/string_helpers.c:150:20: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     150 |         int *ints, nints;
         |                    ^~~~~
     'tokenize_user_input': event 1
       |
       |  150 |         int *ints, nints;
       |      |                    ^~~~~
       |      |                    |
       |      |                    (1) use of uninitialized value '<unknown=
>' here
       |

vim +150 lib/string_helpers.c

16c7fa05829e8b9 Andy Shevchenko 2013-04-30  133  =

53e2025c60da991 Cezary Rojewski 2022-09-01  134  /**
53e2025c60da991 Cezary Rojewski 2022-09-01  135   * tokenize_user_input - S=
plit string into a sequence of integers
53e2025c60da991 Cezary Rojewski 2022-09-01  136   * @from:	The user space b=
uffer to read from
53e2025c60da991 Cezary Rojewski 2022-09-01  137   * @ppos:	The current posi=
tion in the buffer
53e2025c60da991 Cezary Rojewski 2022-09-01  138   * @count:	The maximum num=
ber of bytes to read
53e2025c60da991 Cezary Rojewski 2022-09-01  139   * @tkns:	Returned pointer=
 to sequence of integers
53e2025c60da991 Cezary Rojewski 2022-09-01  140   *
53e2025c60da991 Cezary Rojewski 2022-09-01  141   * On success @tkns is all=
ocated and initialized with a sequence of
53e2025c60da991 Cezary Rojewski 2022-09-01  142   * integers extracted from=
 the @from plus an additional element that
53e2025c60da991 Cezary Rojewski 2022-09-01  143   * begins the sequence and=
 specifies the integers count.
53e2025c60da991 Cezary Rojewski 2022-09-01  144   *
53e2025c60da991 Cezary Rojewski 2022-09-01  145   * Caller takes responsibi=
lity for freeing @tkns when it is no longer
53e2025c60da991 Cezary Rojewski 2022-09-01  146   * needed.
53e2025c60da991 Cezary Rojewski 2022-09-01  147   */
53e2025c60da991 Cezary Rojewski 2022-09-01  148  int tokenize_user_input(co=
nst char __user *from, size_t count, int **tkns)
53e2025c60da991 Cezary Rojewski 2022-09-01  149  {
53e2025c60da991 Cezary Rojewski 2022-09-01 @150  	int *ints, nints;
53e2025c60da991 Cezary Rojewski 2022-09-01  151  	char *buf;
53e2025c60da991 Cezary Rojewski 2022-09-01  152  	int ret =3D 0;
53e2025c60da991 Cezary Rojewski 2022-09-01  153  =

53e2025c60da991 Cezary Rojewski 2022-09-01  154  	buf =3D memdup_user_nul(f=
rom, count);
53e2025c60da991 Cezary Rojewski 2022-09-01  155  	if (IS_ERR(buf))
53e2025c60da991 Cezary Rojewski 2022-09-01  156  		return PTR_ERR(buf);
53e2025c60da991 Cezary Rojewski 2022-09-01  157  =

53e2025c60da991 Cezary Rojewski 2022-09-01  158  	get_options(buf, 0, &nint=
s);
53e2025c60da991 Cezary Rojewski 2022-09-01  159  	if (!nints) {
53e2025c60da991 Cezary Rojewski 2022-09-01  160  		ret =3D -ENOENT;
53e2025c60da991 Cezary Rojewski 2022-09-01  161  		goto free_buf;
53e2025c60da991 Cezary Rojewski 2022-09-01  162  	}
53e2025c60da991 Cezary Rojewski 2022-09-01  163  =

53e2025c60da991 Cezary Rojewski 2022-09-01  164  	ints =3D kcalloc(nints + =
1, sizeof(*ints), GFP_KERNEL);
53e2025c60da991 Cezary Rojewski 2022-09-01  165  	if (!ints) {
53e2025c60da991 Cezary Rojewski 2022-09-01  166  		ret =3D -ENOMEM;
53e2025c60da991 Cezary Rojewski 2022-09-01  167  		goto free_buf;
53e2025c60da991 Cezary Rojewski 2022-09-01  168  	}
53e2025c60da991 Cezary Rojewski 2022-09-01  169  =

53e2025c60da991 Cezary Rojewski 2022-09-01  170  	get_options(buf, nints + =
1, ints);
53e2025c60da991 Cezary Rojewski 2022-09-01  171  	*tkns =3D ints;
53e2025c60da991 Cezary Rojewski 2022-09-01  172  =

53e2025c60da991 Cezary Rojewski 2022-09-01  173  free_buf:
53e2025c60da991 Cezary Rojewski 2022-09-01  174  	kfree(buf);
53e2025c60da991 Cezary Rojewski 2022-09-01  175  	return ret;
53e2025c60da991 Cezary Rojewski 2022-09-01  176  }
53e2025c60da991 Cezary Rojewski 2022-09-01  177  EXPORT_SYMBOL(tokenize_use=
r_input);
53e2025c60da991 Cezary Rojewski 2022-09-01  178  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7947751640307292343==--

