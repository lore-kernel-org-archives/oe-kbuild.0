Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E523AE
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 06:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675664932; x=1707200932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EeRNSzIokOGCgWLDcVD5H4teQCnF96XZsqO9R8XhAYs=;
  b=Pswp8cwpDakS7ma1BNt2w7XiteLpOakQiI/tbsd8+axyd8CXSH/t4vqV
   OzMCNQOe3XU8AZ4ZcrNRV2GhXbJwu9PVKADGoKbqxbMPD8iBqTvWNTcyI
   OlAAJW9peh4Y+pB5gqHBylVZH4EiR2vgQk/rdYWeoGCOkkehNfxJ3lK2s
   wjzOofWvX8o1a9icaUYBWKrsqqdO/a3F9mrb3cMohvXOsxiA8BsKzXA/t
   DgdrtOw3UzmnPX2pDL/eFgFrCKQWrSDtwzEDcWV+undCd/Jhn0Jo+nllP
   btnzcZDJVIpdFFz84iokF5O3ygtG8CBkelT6VO0EuYcRn/QGGUetJikx7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="391535828"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="391535828"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 22:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="643907869"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="643907869"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Feb 2023 22:28:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOuzi-0002Q8-0M;
	Mon, 06 Feb 2023 06:28:50 +0000
Date: Mon, 6 Feb 2023 14:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mmc/host/dw_mmc-k3.c:353:34: warning: shift by count
 ('4294967295') >= precision of type ('32')
Message-ID: <202302061423.fbvQPlYY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/mmc/host/dw_mmc-k3.c:353:34: warning: shift by count ('4294967295') >= precision of type ('32') [-Wanalyzer-shift-count-overflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: 3d427228f7370894680580fcd0381c0349624fa1 ARM: ixp4xx: enable multiplatform support
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230205 (https://download.01.org/0day-ci/archive/20230206/202302061423.fbvQPlYY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3d427228f7370894680580fcd0381c0349624fa1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3d427228f7370894680580fcd0381c0349624fa1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/mmc/host/dw_mmc-k3.c: In function 'dw_mci_get_best_clksmpl':
>> drivers/mmc/host/dw_mmc-k3.c:353:34: warning: shift by count ('4294967295') >= precision of type ('32') [-Wanalyzer-shift-count-overflow]
     353 |                 interval = ffs(v >> len) - 1;
         |                                ~~^~~~~~
     'dw_mci_get_best_clksmpl': events 1-6
       |
       |  321 | static int dw_mci_get_best_clksmpl(unsigned int sample_flag)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'dw_mci_get_best_clksmpl'
       |......
       |  331 |         if (!sample_flag)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'sample_flag != 0')...
       |......
       |  334 |         if (~sample_flag == 0)
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (4) following 'false' branch (when 'sample_flag != 4294967295')...
       |      |         (3) ...to here
       |......
       |  337 |         i = ffs(sample_flag) - 1;
       |      |         ~   ~~~~~~~~~~~~~~~~
       |      |         |   |
       |      |         |   (6) calling 'ffs' from 'dw_mci_get_best_clksmpl'
       |      |         (5) ...to here
       |
       +--> 'ffs': events 7-8
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (7) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (8) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 9
              |
              |cc1:
              | (9): ...to here
              |
       <------+
       |
     'dw_mci_get_best_clksmpl': events 10-13
       |
       |drivers/mmc/host/dw_mmc-k3.c:337:13:
       |  337 |         i = ffs(sample_flag) - 1;
       |      |             ^~~~~~~~~~~~~~~~
       |      |             |
       |      |             (10) returning to 'dw_mci_get_best_clksmpl' from 'ffs'
       |......
       |  344 |         while (i < 32) {
       |      |                ~~~~~~
       |      |                  |
       |      |                  (11) following 'true' branch (when 'i <= 31')...
       |  345 |                 v = ror32(sample_flag, i);
       |      |                 ~
       |      |                 |
       |      |                 (12) ...to here
       |  346 |                 len = ffs(~v) - 1;
       |      |                       ~~~~~~~
       |      |                       |
       |      |                       (13) calling 'ffs' from 'dw_mci_get_best_clksmpl'
       |
       +--> 'ffs': events 14-15
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (14) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (15) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 16
              |
              |cc1:
              | (16): ...to here
              |
       <------+
       |
     'dw_mci_get_best_clksmpl': events 17-20
       |
       |drivers/mmc/host/dw_mmc-k3.c:346:23:
       |  346 |                 len = ffs(~v) - 1;
       |      |                       ^~~~~~~
       |      |                       |
       |      |                       (17) returning to 'dw_mci_get_best_clksmpl' from 'ffs'
       |  347 | 
       |  348 |                 if (len > range_length) {
       |      |                    ~   
       |      |                    |
       |      |                    (18) following 'true' branch (when 'range_length < len')...
       |  349 |                         range_length = len;
--
   drivers/input/misc/axp20x-pek.c: In function 'axp20x_show_attr':
   drivers/input/misc/axp20x-pek.c:93:22: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      93 |         unsigned int val;
         |                      ^~~
     'axp20x_show_attr': event 1
       |
       |   93 |         unsigned int val;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unknown>' here
       |
>> drivers/input/misc/axp20x-pek.c:101:13: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     101 |         val >>= ffs(mask) - 1;
         |             ^~~
     'axp20x_show_attr': events 1-4
       |
       |   88 | static ssize_t axp20x_show_attr(struct device *dev,
       |      |                ^~~~~~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'axp20x_show_attr'
       |......
       |   97 |         if (ret != 0)
       |      |            ~    
       |      |            |
       |      |            (2) following 'false' branch (when 'ret == 0')...
       |......
       |  100 |         val &= mask;
       |      |         ~~~     
       |      |         |
       |      |         (3) ...to here
       |  101 |         val >>= ffs(mask) - 1;
       |      |                 ~~~~~~~~~
       |      |                 |
       |      |                 (4) calling 'ffs' from 'axp20x_show_attr'
       |
       +--> 'ffs': events 5-6
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (5) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (6) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'axp20x_show_attr': events 8-9
       |
       |drivers/input/misc/axp20x-pek.c:101:17:
       |  101 |         val >>= ffs(mask) - 1;
       |      |             ~~~ ^~~~~~~~~
       |      |             |   |
       |      |             |   (8) returning to 'axp20x_show_attr' from 'ffs'
       |      |             (9) shift by negative amount here ('-1')
       |
   drivers/input/misc/axp20x-pek.c: In function 'axp20x_store_attr':
   drivers/input/misc/axp20x-pek.c:139:22: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     139 |         unsigned int val, idx = 0;
         |                      ^~~
     'axp20x_store_attr': event 1
       |
       |  139 |         unsigned int val, idx = 0;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unknown>' here
       |
   drivers/input/misc/axp20x-pek.c:166:13: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     166 |         idx <<= ffs(mask) - 1;
         |             ^~~
     'axp20x_store_attr': events 1-2
       |
       |  130 | static ssize_t axp20x_store_attr(struct device *dev,
       |      |                ^~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'axp20x_store_attr'
       |......
       |  150 |         if (ret)
       |      |            ~    
       |      |            |
       |      |            (2) following 'false' branch (when 'ret == 0')...
       |
     'axp20x_store_attr': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'axp20x_store_attr': events 4-6
       |
       |  153 |         for (i = 3; i >= 0; i--) {
       |      |                     ~~^~~~
       |      |                       |
       |      |                       (4) following 'true' branch (when 'i != -1')...
       |  154 |                 unsigned int err;
       |      |                 ~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |......
       |  166 |         idx <<= ffs(mask) - 1;
       |      |                 ~~~~~~~~~
       |      |                 |
       |      |                 (6) calling 'ffs' from 'axp20x_store_attr'
       |
       +--> 'ffs': events 7-8
--
       | 1094 |         if (err > 0) {
       |      |            ~   
       |      |            |
       |      |            (11) following 'true' branch (when 'err > 0')...
       | 1095 |                 nroots = find_poly_roots(bch, 1, bch->elp, errloc);
       |      |                 ~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |        |
       |      |                 |        (13) calling 'find_poly_roots' from 'bch_decode'
       |      |                 (12) ...to here
       |
       +--> 'find_poly_roots': events 14-15
              |
              |  941 | static int find_poly_roots(struct bch_control *bch, unsigned int k,
              |      |            ^~~~~~~~~~~~~~~
              |      |            |
              |      |            (14) entry to 'find_poly_roots'
              |......
              |  945 |         struct gf_poly *f1, *f2;
              |      |                         ~~
              |      |                         |
              |      |                         (15) use of uninitialized value '<unknown>' here
              |
   lib/bch.c:945:30: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     945 |         struct gf_poly *f1, *f2;
         |                              ^~
     'bch_decode': events 1-4
       |
       | 1053 | int bch_decode(struct bch_control *bch, const uint8_t *data, unsigned int len,
       |      |     ^~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'bch_decode'
       |......
       | 1063 |         if (8*len > (bch->n-bch->ecc_bits))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1067 |         if (!syn) {
       |      |         ~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 1093 |         err = compute_error_locator_polynomial(bch, syn);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (4) calling 'compute_error_locator_polynomial' from 'bch_decode'
       |
       +--> 'compute_error_locator_polynomial': events 5-9
              |
              |  443 | static int compute_error_locator_polynomial(struct bch_control *bch,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'compute_error_locator_polynomial'
              |......
              |  463 |         for (i = 0; (i < t) && (elp->deg <= t); i++) {
              |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                             |      |
              |      |                             |      (7) ...to here
              |      |                             (6) following 'true' branch (when 'i != 4')...
              |......
              |  485 |                 if (i < t-1) {
              |      |                    ~
              |      |                    |
              |      |                    (8) following 'true' branch (when 'i != 3')...
              |  486 |                         d = syn[2*i+2];
              |      |                         ~
              |      |                         |
              |      |                         (9) ...to here
              |
       <------+
       |
     'bch_decode': events 10-13
       |
       | 1093 |         err = compute_error_locator_polynomial(bch, syn);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (10) returning to 'bch_decode' from 'compute_error_locator_polynomial'
       | 1094 |         if (err > 0) {
       |      |            ~   
       |      |            |
       |      |            (11) following 'true' branch (when 'err > 0')...
       | 1095 |                 nroots = find_poly_roots(bch, 1, bch->elp, errloc);
       |      |                 ~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |        |
       |      |                 |        (13) calling 'find_poly_roots' from 'bch_decode'
       |      |                 (12) ...to here
       |
       +--> 'find_poly_roots': events 14-15
              |
              |  941 | static int find_poly_roots(struct bch_control *bch, unsigned int k,
              |      |            ^~~~~~~~~~~~~~~
              |      |            |
              |      |            (14) entry to 'find_poly_roots'
              |......
              |  945 |         struct gf_poly *f1, *f2;
              |      |                              ~~
              |      |                              |
              |      |                              (15) use of uninitialized value '<unknown>' here
              |
   lib/bch.c: In function 'build_mod8_tables':
>> lib/bch.c:1167:46: warning: shift by count ('32') >= precision of type ('32') [-Wanalyzer-shift-count-overflow]
    1167 |                                 data ^= g[0] >> (31-d);
         |                                         ~~~~~^~~~~~~~~
     'build_mod8_tables': events 1-2
       |
       | 1148 | static void build_mod8_tables(struct bch_control *bch, const uint32_t *g)
       |      |             ^~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'build_mod8_tables'
       |......
       | 1158 |         for (i = 0; i < 256; i++) {
       |      |                     ~~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch (when 'i != 256')...
       |
     'build_mod8_tables': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'build_mod8_tables': events 4-8
       |
       | 1158 |         for (i = 0; i < 256; i++) {
       |      |                     ~~~~~~~    
       |      |                       |
       |      |                       (8) following 'true' branch (when 'i != 256')...
       | 1159 |                 /* p(X)=i is a small polynomial of weight <= 8 */
       | 1160 |                 for (b = 0; b < 4; b++) {
       |      |                             ~~^~~  ~~~
       |      |                               |     |
       |      |                               |     (7) ...to here
       |      |                               (4) following 'true' branch (when 'b != 4')...
       | 1161 |                         /* we want to compute (p(X).X^(8*b+deg(g))) mod g(X) */
       | 1162 |                         tab = bch->mod8_tab + (b*256+i)*l;
       |      |                         ~~~    
       |      |                         |
       |      |                         (5) ...to here
       | 1163 |                         data = i << (8*b);
       | 1164 |                         while (data) {
       |      |                                ~~~~
       |      |                                |
       |      |                                (6) following 'false' branch (when 'data == 0')...
       |
     'build_mod8_tables': event 9
       |
       |cc1:
       | (9): ...to here
       |
     'build_mod8_tables': event 10
       |
       | 1165 |                                 d = deg(data);
       |      |                                     ^~~~~~~~~
       |      |                                     |
       |      |                                     (10) calling 'deg' from 'build_mod8_tables'
       |
       +--> 'deg': event 11
              |
              |  342 | static inline int deg(unsigned int poly)
              |      |                   ^~~
              |      |                   |
              |      |                   (11) entry to 'deg'
              |
            'deg': event 12
              |
              |include/asm-generic/bitops/fls.h:17:12:
              |   17 |         if (!x)
              |      |            ^
              |      |            |
              |      |            (12) following 'true' branch (when 'poly == 0')...
              |
            'deg': event 13
              |
              |lib/bch.c:345:25:
              |  345 |         return fls(poly)-1;
              |      |                ~~~~~~~~~^~
              |      |                         |
              |      |                         (13) ...to here
              |
       <------+
       |
     'build_mod8_tables': events 14-15
       |
       | 1165 |                                 d = deg(data);
       |      |                                     ^~~~~~~~~
       |      |                                     |
       |      |                                     (14) returning to 'build_mod8_tables' from 'deg'
       | 1166 |                                 /* subtract X^d.g(X) from p(X).X^(8*b+deg(g)) */
       | 1167 |                                 data ^= g[0] >> (31-d);
       |      |                                         ~~~~~~~~~~~~~~
       |      |                                              |
       |      |                                              (15) shift by count '32' here
       |
   lib/bch.c:1171:66: warning: shift by count ('32') >= precision of type ('32') [-Wanalyzer-shift-count-overflow]
    1170 |                                         lo = (j+1 < plen) ?
         |                                              ~~~~~~~~~~~~~~       
    1171 |                                                 g[j+1] >> (31-d) : 0;
         |                                                 ~~~~~~~~~~~~~~~~~^~~
     'build_mod8_tables': events 1-2
       |
       | 1148 | static void build_mod8_tables(struct bch_control *bch, const uint32_t *g)
       |      |             ^~~~~~~~~~~~~~~~~
--
   drivers/regulator/mt6359-regulator.c: In function 'mt6359_get_status':
   drivers/regulator/mt6359-regulator.c:253:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     253 |         u32 regval;
         |             ^~~~~~
     'mt6359_get_status': event 1
       |
       |  253 |         u32 regval;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/regulator/mt6359-regulator.c: In function 'mt6359_regulator_get_mode':
   drivers/regulator/mt6359-regulator.c:271:18: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     271 |         int ret, regval;
         |                  ^~~~~~
     'mt6359_regulator_get_mode': event 1
       |
       |  271 |         int ret, regval;
       |      |                  ^~~~~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>' here
       |
>> drivers/regulator/mt6359-regulator.c:281:16: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     281 |         regval >>= ffs(info->modeset_mask) - 1;
         |                ^~~
     'mt6359_regulator_get_mode': events 1-4
       |
       |  268 | static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
       |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (1) entry to 'mt6359_regulator_get_mode'
       |......
       |  274 |         if (ret != 0) {
       |      |            ~         
       |      |            |
       |      |            (2) following 'false' branch (when 'ret == 0')...
       |......
       |  280 |         regval &= info->modeset_mask;
       |      |         ~~~~~~       
       |      |         |
       |      |         (3) ...to here
       |  281 |         regval >>= ffs(info->modeset_mask) - 1;
       |      |                    ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                    |
       |      |                    (4) calling 'ffs' from 'mt6359_regulator_get_mode'
       |
       +--> 'ffs': events 5-6
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (5) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (6) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'mt6359_regulator_get_mode': events 8-9
       |
       |drivers/regulator/mt6359-regulator.c:281:20:
       |  281 |         regval >>= ffs(info->modeset_mask) - 1;
       |      |                ~~~ ^~~~~~~~~~~~~~~~~~~~~~~
       |      |                |   |
       |      |                |   (8) returning to 'mt6359_regulator_get_mode' from 'ffs'
       |      |                (9) shift by negative amount here ('-1')
       |
   drivers/regulator/mt6359-regulator.c: In function 'mt6359_regulator_set_mode':
   drivers/regulator/mt6359-regulator.c:310:21: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     310 |                 val <<= ffs(info->modeset_mask) - 1;
         |                     ^~~
     'mt6359_regulator_set_mode': events 1-4
       |
       |  299 | static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mt6359_regulator_set_mode'
       |......
       |  307 |         switch (mode) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |  308 |         case REGULATOR_MODE_FAST:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |  309 |                 val = MT6359_BUCK_MODE_FORCE_PWM;
       |  310 |                 val <<= ffs(info->modeset_mask) - 1;
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (4) calling 'ffs' from 'mt6359_regulator_set_mode'
       |
       +--> 'ffs': events 5-6
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (5) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (6) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'mt6359_regulator_set_mode': events 8-9
       |
       |drivers/regulator/mt6359-regulator.c:310:25:
--
   drivers/regulator/pca9450-regulator.c: In function 'buck_set_dvs':
   drivers/regulator/pca9450-regulator.c:158:18: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     158 |         uint32_t uv;
         |                  ^~
     'buck_set_dvs': event 1
       |
       |  158 |         uint32_t uv;
       |      |                  ^~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>' here
       |
>> drivers/regulator/pca9450-regulator.c:171:27: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     171 |                         i <<= ffs(desc->vsel_mask) - 1;
         |                           ^~~
     'buck_set_dvs': events 1-4
       |
       |  153 | static int buck_set_dvs(const struct regulator_desc *desc,
       |      |            ^~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'buck_set_dvs'
       |......
       |  161 |         if (ret == -EINVAL)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret != -22')...
       |  162 |                 return 0;
       |  163 |         else if (ret)
       |      |              ~~ ~
       |      |              |  |
       |      |              |  (4) following 'false' branch (when 'ret == 0')...
       |      |              (3) ...to here
       |
     'buck_set_dvs': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'buck_set_dvs': events 6-12
       |
       |  166 |         for (i = 0; i < desc->n_voltages; i++) {
       |      |                     ~~^~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (6) following 'true' branch...
       |  167 |                 ret = regulator_desc_list_voltage_linear_range(desc, i);
       |      |                 ~~~    
       |      |                 |
       |      |                 (7) ...to here
       |  168 |                 if (ret < 0)
       |      |                    ~   
       |      |                    |
       |      |                    (8) following 'false' branch (when 'ret >= 0')...
       |  169 |                         continue;
       |  170 |                 if (ret == uv) {
       |      |                 ~~ ~   
       |      |                 |  |
       |      |                 |  (10) following 'true' branch...
       |      |                 (9) ...to here
       |  171 |                         i <<= ffs(desc->vsel_mask) - 1;
       |      |                         ~     ~~~~~~~~~~~~~~~~~~~~
       |      |                         |     |
       |      |                         |     (12) calling 'ffs' from 'buck_set_dvs'
       |      |                         (11) ...to here
       |
       +--> 'ffs': events 13-14
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (13) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (14) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 15
              |
              |cc1:
              | (15): ...to here
              |
       <------+
       |
     'buck_set_dvs': events 16-17
       |
       |drivers/regulator/pca9450-regulator.c:171:31:
       |  171 |                         i <<= ffs(desc->vsel_mask) - 1;
       |      |                           ~~~ ^~~~~~~~~~~~~~~~~~~~
       |      |                           |   |
       |      |                           |   (16) returning to 'buck_set_dvs' from 'ffs'
       |      |                           (17) shift by negative amount here ('-1')
       |
   drivers/regulator/pca9450-regulator.c: In function 'pca9450_irq_handler':
   drivers/regulator/pca9450-regulator.c:662:22: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     662 |         unsigned int status;
         |                      ^~~~~~
     'pca9450_irq_handler': event 1
       |
       |  662 |         unsigned int status;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unknown>' here
       |
   drivers/regulator/pca9450-regulator.c: In function 'pca9450_i2c_probe':
   drivers/regulator/pca9450-regulator.c:704:22: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     704 |         unsigned int device_id, i;
         |                      ^~~~~~~~~
     'pca9450_i2c_probe': event 1
       |
       |  704 |         unsigned int device_id, i;
       |      |                      ^~~~~~~~~
       |      |                      |
--
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_read_8':
   drivers/misc/lis3lv02d/lis3lv02d.c:118:12: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     118 |         s8 lo;
         |            ^~
     'lis3lv02d_read_8': event 1
       |
       |  118 |         s8 lo;
       |      |            ^~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_read_12':
   drivers/misc/lis3lv02d/lis3lv02d.c:127:12: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     127 |         u8 lo, hi;
         |            ^~
     'lis3lv02d_read_12': event 1
       |
       |  127 |         u8 lo, hi;
       |      |            ^~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c:127:16: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     127 |         u8 lo, hi;
         |                ^~
     'lis3lv02d_read_12': event 1
       |
       |  127 |         u8 lo, hi;
       |      |                ^~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis331dlh_read_data':
   drivers/misc/lis3lv02d/lis3lv02d.c:138:12: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     138 |         u8 lo, hi;
         |            ^~
     'lis331dlh_read_data': event 1
       |
       |  138 |         u8 lo, hi;
       |      |            ^~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c:138:16: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     138 |         u8 lo, hi;
         |                ^~
     'lis331dlh_read_data': event 1
       |
       |  138 |         u8 lo, hi;
       |      |                ^~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_get_odr_index':
   drivers/misc/lis3lv02d/lis3lv02d.c:213:12: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     213 |         u8 ctrl;
         |            ^~~~
     'lis3lv02d_get_odr_index': event 1
       |
       |  213 |         u8 ctrl;
       |      |            ^~~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
>> drivers/misc/lis3lv02d/lis3lv02d.c:219:22: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     219 |         return (ctrl >> shift);
         |                ~~~~~~^~~~~~~~~
     'lis3lv02d_get_odr_index': events 1-2
       |
       |  211 | static int lis3lv02d_get_odr_index(struct lis3lv02d *lis3)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'lis3lv02d_get_odr_index'
       |......
       |  218 |         shift = ffs(lis3->odr_mask) - 1;
       |      |                 ~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) calling 'ffs' from 'lis3lv02d_get_odr_index'
       |
       +--> 'ffs': events 3-4
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (3) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (4) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'lis3lv02d_get_odr_index': events 6-7
       |
       |drivers/misc/lis3lv02d/lis3lv02d.c:218:17:
       |  218 |         shift = ffs(lis3->odr_mask) - 1;
       |      |                 ^~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) returning to 'lis3lv02d_get_odr_index' from 'ffs'
       |  219 |         return (ctrl >> shift);
       |      |                ~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (7) shift by negative amount here ('-1')
       |
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_set_odr':
   drivers/misc/lis3lv02d/lis3lv02d.c:244:12: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     244 |         u8 ctrl;
         |            ^~~~
     'lis3lv02d_set_odr': event 1
       |
       |  244 |         u8 ctrl;
       |      |            ^~~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_selftest':
   drivers/misc/lis3lv02d/lis3lv02d.c:266:20: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     266 |         u8 ctlreg, reg;
         |                    ^~~
     'lis3lv02d_selftest': event 1
       |
       |  266 |         u8 ctlreg, reg;
       |      |                    ^~~
       |      |                    |
       |      |                    (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c:270:12: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     270 |         u8 ctrl_reg_data;
         |            ^~~~~~~~~~~~~
     'lis3lv02d_selftest': event 1
       |
       |  270 |         u8 ctrl_reg_data;
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_poweron':
   drivers/misc/lis3lv02d/lis3lv02d.c:406:12: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     406 |         u8 reg;
         |            ^~~
     'lis3lv02d_poweron': event 1
       |
       |  406 |         u8 reg;
       |      |            ^~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_joystick_poll':
   drivers/misc/lis3lv02d/lis3lv02d.c:448:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     448 |         int x, y, z;
         |             ^
     'lis3lv02d_joystick_poll': event 1
       |
       |  448 |         int x, y, z;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +353 drivers/mmc/host/dw_mmc-k3.c

361c7fe9b02eee7 liwei 2017-08-11  320  
361c7fe9b02eee7 liwei 2017-08-11  321  static int dw_mci_get_best_clksmpl(unsigned int sample_flag)
361c7fe9b02eee7 liwei 2017-08-11  322  {
361c7fe9b02eee7 liwei 2017-08-11  323  	int i;
361c7fe9b02eee7 liwei 2017-08-11  324  	int interval;
361c7fe9b02eee7 liwei 2017-08-11  325  	unsigned int v;
361c7fe9b02eee7 liwei 2017-08-11  326  	unsigned int len;
361c7fe9b02eee7 liwei 2017-08-11  327  	unsigned int range_start = 0;
361c7fe9b02eee7 liwei 2017-08-11  328  	unsigned int range_length = 0;
361c7fe9b02eee7 liwei 2017-08-11  329  	unsigned int middle_range = 0;
361c7fe9b02eee7 liwei 2017-08-11  330  
361c7fe9b02eee7 liwei 2017-08-11  331  	if (!sample_flag)
361c7fe9b02eee7 liwei 2017-08-11  332  		return -EIO;
361c7fe9b02eee7 liwei 2017-08-11  333  
361c7fe9b02eee7 liwei 2017-08-11  334  	if (~sample_flag == 0)
361c7fe9b02eee7 liwei 2017-08-11  335  		return 0;
361c7fe9b02eee7 liwei 2017-08-11  336  
361c7fe9b02eee7 liwei 2017-08-11  337  	i = ffs(sample_flag) - 1;
361c7fe9b02eee7 liwei 2017-08-11  338  
361c7fe9b02eee7 liwei 2017-08-11  339  	/*
361c7fe9b02eee7 liwei 2017-08-11  340  	* A clock cycle is divided into 32 phases,
361c7fe9b02eee7 liwei 2017-08-11  341  	* each of which is represented by a bit,
361c7fe9b02eee7 liwei 2017-08-11  342  	* finding the optimal phase.
361c7fe9b02eee7 liwei 2017-08-11  343  	*/
361c7fe9b02eee7 liwei 2017-08-11  344  	while (i < 32) {
361c7fe9b02eee7 liwei 2017-08-11  345  		v = ror32(sample_flag, i);
361c7fe9b02eee7 liwei 2017-08-11  346  		len = ffs(~v) - 1;
361c7fe9b02eee7 liwei 2017-08-11  347  
361c7fe9b02eee7 liwei 2017-08-11  348  		if (len > range_length) {
361c7fe9b02eee7 liwei 2017-08-11  349  			range_length = len;
361c7fe9b02eee7 liwei 2017-08-11  350  			range_start = i;
361c7fe9b02eee7 liwei 2017-08-11  351  		}
361c7fe9b02eee7 liwei 2017-08-11  352  
361c7fe9b02eee7 liwei 2017-08-11 @353  		interval = ffs(v >> len) - 1;
361c7fe9b02eee7 liwei 2017-08-11  354  		if (interval < 0)
361c7fe9b02eee7 liwei 2017-08-11  355  			break;
361c7fe9b02eee7 liwei 2017-08-11  356  
361c7fe9b02eee7 liwei 2017-08-11  357  		i += len + interval;
361c7fe9b02eee7 liwei 2017-08-11  358  	}
361c7fe9b02eee7 liwei 2017-08-11  359  
361c7fe9b02eee7 liwei 2017-08-11  360  	middle_range = range_start + range_length / 2;
361c7fe9b02eee7 liwei 2017-08-11  361  	if (middle_range >= 32)
361c7fe9b02eee7 liwei 2017-08-11  362  		middle_range %= 32;
361c7fe9b02eee7 liwei 2017-08-11  363  
361c7fe9b02eee7 liwei 2017-08-11  364  	return middle_range;
361c7fe9b02eee7 liwei 2017-08-11  365  }
361c7fe9b02eee7 liwei 2017-08-11  366  

:::::: The code at line 353 was first introduced by commit
:::::: 361c7fe9b02eee7e1dd950ba70d701d03d292500 mmc: dw_mmc-k3: add sd support for hi3660

:::::: TO: liwei <liwei213@huawei.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
