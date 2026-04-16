Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F20C3C455B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Apr 2026 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347024; cv=none; b=GswGkndwCgb2BUR9mqBpXn6ncjZ5H4iWa4f1xkBJ0O32CHgthIYAGAWtN8J0J8iwAS5xO3W8fhfrmtkWOPXjlcecbC7YoNGvZ5IDKHCJZgSfIwM2e/JsdJFW+8Mpr59+lvhs3YX9ann7LTm3ZRrBKTs47AfKutVd72bbtBN7R+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347024; c=relaxed/simple;
	bh=7z8Y1irHtjln0ynUQy7axdiaQIHtQUn9QCrfZcvz2QI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IyJepGlJzAuLB9cmIOiYdBoZ7OygZ1NCmjh3yRV3TYy5mofL+1A8sROUQBmjXF2EmNxtcUATiaEOzSooqFNG6iZog2a+1yiPd9vcEQnA2ao6ouHuqPMHm3gj17AVehbqP0TzqylP8jdSeBNQGEnFE908m65uN9ij45Kun15oPdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+EHgYn+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+EHgYn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776347021; x=1807883021;
  h=date:from:to:cc:subject:message-id;
  bh=7z8Y1irHtjln0ynUQy7axdiaQIHtQUn9QCrfZcvz2QI=;
  b=Q+EHgYn+SIcxuXANeRD2P/mkbbnPl+kAnQKwF+ciFOv5mio9LA1nVKpy
   vuLE58BaF9Xofjuq7IYy3RX/IwQU4fiw36Um0bFEaapyJzQfzbX/OSiqo
   drGC1QXWmatScoeLWJjhfcXgRN6kMSnJxk2kgGQDCmDMMWAXodJwIMryA
   a7RByaMlmlcpUpErf66KbuxC2xIIcs2u9sLFZpVNfTO1MIZOBVNDNH+jB
   GxVdebHDIVfKG02c1Dbu0npvdA1qhZ1jFsZPcQM/SS50aMr0D5HjJPGXs
   iDO9WBlSfjFOOh5ypQ+Da6zwQQMZYMjgJWdyynMfzyr6GLMamiwMHR/5I
   g==;
X-CSE-ConnectionGUID: hxEU7fLxRBS4NG5sBti2aA==
X-CSE-MsgGUID: FuFVlUrmS+GwfHw0M1IlNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99994577"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="99994577"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 06:43:40 -0700
X-CSE-ConnectionGUID: 84HRh+FgQKCD42pp8Fb9/w==
X-CSE-MsgGUID: qAKLsbunQMSuGTGo44rnEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="232479282"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2026 06:43:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDN0K-0000000012z-0CQB;
	Thu, 16 Apr 2026 13:43:36 +0000
Date: Thu, 16 Apr 2026 15:43:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml:56:8:
 [warning] wrong indentation: expected 8 but found 7 (indentation)
Message-ID: <202604161518.mkvVhS1S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Minda Chen <minda.chen@starfivetech.com>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Minda-Chen/dt-bindings-net-starfive-jh7110-dwmac-Remove-JH8100/20260416-050838
head:   40cba8a98f1f0bdfeb94956954cf9bf93718fc52
commit: f668ff83b99a8910b17f24b8a40647276342d698 dt-bindings: net: starfive,jh7110-dwmac: Add JHB100 sgmii rx clk
date:   16 hours ago
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arc-randconfig-2052-20260416 (https://download.01.org/0day-ci/archive/20260416/202604161518.mkvVhS1S-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161518.mkvVhS1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604161518.mkvVhS1S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml:56:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +56 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml

b76eaf7d7ede35 Yanhong Wang       2023-04-17    9  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   10  maintainers:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   11    - Emil Renner Berthing <kernel@esmil.dk>
b76eaf7d7ede35 Yanhong Wang       2023-04-17   12    - Samin Guo <samin.guo@starfivetech.com>
b76eaf7d7ede35 Yanhong Wang       2023-04-17   13  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   14  select:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   15    properties:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   16      compatible:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   17        contains:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   18          enum:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   19            - starfive,jh7100-dwmac
b76eaf7d7ede35 Yanhong Wang       2023-04-17   20            - starfive,jh7110-dwmac
23120903a5e7b0 Minda Chen         2026-04-08   21            - starfive,jhb100-dwmac
b76eaf7d7ede35 Yanhong Wang       2023-04-17   22    required:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   23      - compatible
b76eaf7d7ede35 Yanhong Wang       2023-04-17   24  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   25  properties:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   26    compatible:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   27      oneOf:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   28        - items:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   29            - const: starfive,jh7100-dwmac
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   30            - const: snps,dwmac
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   31        - items:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   32            - const: starfive,jh7110-dwmac
b76eaf7d7ede35 Yanhong Wang       2023-04-17   33            - const: snps,dwmac-5.20
23120903a5e7b0 Minda Chen         2026-04-08   34        - items:
23120903a5e7b0 Minda Chen         2026-04-08   35            - const: starfive,jhb100-dwmac
23120903a5e7b0 Minda Chen         2026-04-08   36            - const: snps,dwmac-5.20
b76eaf7d7ede35 Yanhong Wang       2023-04-17   37  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   38    reg:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   39      maxItems: 1
b76eaf7d7ede35 Yanhong Wang       2023-04-17   40  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   41    clocks:
f668ff83b99a89 Minda Chen         2026-04-08   42      minItems: 5
b76eaf7d7ede35 Yanhong Wang       2023-04-17   43      items:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   44        - description: GMAC main clock
b76eaf7d7ede35 Yanhong Wang       2023-04-17   45        - description: GMAC AHB clock
b76eaf7d7ede35 Yanhong Wang       2023-04-17   46        - description: PTP clock
b76eaf7d7ede35 Yanhong Wang       2023-04-17   47        - description: TX clock
b76eaf7d7ede35 Yanhong Wang       2023-04-17   48        - description: GTX clock
f668ff83b99a89 Minda Chen         2026-04-08   49        - description: SGMII RX clock
b76eaf7d7ede35 Yanhong Wang       2023-04-17   50  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   51    clock-names:
f668ff83b99a89 Minda Chen         2026-04-08   52      minItems: 5
f668ff83b99a89 Minda Chen         2026-04-08   53      maxItems: 6
f668ff83b99a89 Minda Chen         2026-04-08   54      contains:
f668ff83b99a89 Minda Chen         2026-04-08   55        enum:
f668ff83b99a89 Minda Chen         2026-04-08  @56         - stmmaceth
f668ff83b99a89 Minda Chen         2026-04-08   57         - pclk
f668ff83b99a89 Minda Chen         2026-04-08   58         - ptp_ref
f668ff83b99a89 Minda Chen         2026-04-08   59         - tx
f668ff83b99a89 Minda Chen         2026-04-08   60         - gtx
f668ff83b99a89 Minda Chen         2026-04-08   61         - rx
b76eaf7d7ede35 Yanhong Wang       2023-04-17   62  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   63    starfive,tx-use-rgmii-clk:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   64      description:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   65        Tx clock is provided by external rgmii clock.
b76eaf7d7ede35 Yanhong Wang       2023-04-17   66      type: boolean
b76eaf7d7ede35 Yanhong Wang       2023-04-17   67  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   68    starfive,syscon:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   69      $ref: /schemas/types.yaml#/definitions/phandle-array
b76eaf7d7ede35 Yanhong Wang       2023-04-17   70      items:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   71        - items:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   72            - description: phandle to syscon that configures phy mode
b76eaf7d7ede35 Yanhong Wang       2023-04-17   73            - description: Offset of phy mode selection
b76eaf7d7ede35 Yanhong Wang       2023-04-17   74            - description: Shift of phy mode selection
b76eaf7d7ede35 Yanhong Wang       2023-04-17   75      description:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   76        A phandle to syscon with two arguments that configure phy mode.
b76eaf7d7ede35 Yanhong Wang       2023-04-17   77        The argument one is the offset of phy mode selection, the
b76eaf7d7ede35 Yanhong Wang       2023-04-17   78        argument two is the shift of phy mode selection.
b76eaf7d7ede35 Yanhong Wang       2023-04-17   79  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   80  required:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   81    - compatible
b76eaf7d7ede35 Yanhong Wang       2023-04-17   82    - reg
b76eaf7d7ede35 Yanhong Wang       2023-04-17   83    - clocks
b76eaf7d7ede35 Yanhong Wang       2023-04-17   84    - clock-names
b76eaf7d7ede35 Yanhong Wang       2023-04-17   85    - interrupts
b76eaf7d7ede35 Yanhong Wang       2023-04-17   86    - interrupt-names
b76eaf7d7ede35 Yanhong Wang       2023-04-17   87    - resets
b76eaf7d7ede35 Yanhong Wang       2023-04-17   88    - reset-names
b76eaf7d7ede35 Yanhong Wang       2023-04-17   89  
b76eaf7d7ede35 Yanhong Wang       2023-04-17   90  allOf:
b76eaf7d7ede35 Yanhong Wang       2023-04-17   91    - $ref: snps,dwmac.yaml#
b76eaf7d7ede35 Yanhong Wang       2023-04-17   92  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   93    - if:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   94        properties:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   95          compatible:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   96            contains:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   97              const: starfive,jh7100-dwmac
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   98      then:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26   99        properties:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  100          interrupts:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  101            minItems: 2
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  102            maxItems: 2
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  103  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  104          interrupt-names:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  105            minItems: 2
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  106            maxItems: 2
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  107  
f668ff83b99a89 Minda Chen         2026-04-08  108          clocks:
f668ff83b99a89 Minda Chen         2026-04-08  109            minItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  110            maxItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  111  
f668ff83b99a89 Minda Chen         2026-04-08  112          clock-names:
f668ff83b99a89 Minda Chen         2026-04-08  113            minItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  114            maxItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  115  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  116          resets:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  117            maxItems: 1
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  118  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  119          reset-names:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  120            const: ahb
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  121  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  122    - if:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  123        properties:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  124          compatible:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  125            contains:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  126              const: starfive,jh7110-dwmac
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  127      then:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  128        properties:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  129          interrupts:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  130            minItems: 3
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  131            maxItems: 3
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  132  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  133          interrupt-names:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  134            minItems: 3
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  135            maxItems: 3
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  136  
f668ff83b99a89 Minda Chen         2026-04-08  137          clocks:
f668ff83b99a89 Minda Chen         2026-04-08  138            minItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  139            maxItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  140  
f668ff83b99a89 Minda Chen         2026-04-08  141          clock-names:
f668ff83b99a89 Minda Chen         2026-04-08  142            minItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  143            maxItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  144  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  145          resets:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  146            minItems: 2
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  147  
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  148          reset-names:
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  149            minItems: 2
53e41b76a8ff27 Cristian Ciocaltea 2024-01-26  150  
23120903a5e7b0 Minda Chen         2026-04-08  151    - if:
23120903a5e7b0 Minda Chen         2026-04-08  152        properties:
23120903a5e7b0 Minda Chen         2026-04-08  153          compatible:
23120903a5e7b0 Minda Chen         2026-04-08  154            contains:
23120903a5e7b0 Minda Chen         2026-04-08  155              const: starfive,jhb100-dwmac
23120903a5e7b0 Minda Chen         2026-04-08  156      then:
23120903a5e7b0 Minda Chen         2026-04-08  157        properties:
23120903a5e7b0 Minda Chen         2026-04-08  158          interrupts:
23120903a5e7b0 Minda Chen         2026-04-08  159            maxItems: 1
23120903a5e7b0 Minda Chen         2026-04-08  160  
23120903a5e7b0 Minda Chen         2026-04-08  161          interrupt-names:
23120903a5e7b0 Minda Chen         2026-04-08  162            const: macirq
23120903a5e7b0 Minda Chen         2026-04-08  163  
f668ff83b99a89 Minda Chen         2026-04-08  164          clocks:
f668ff83b99a89 Minda Chen         2026-04-08  165            minItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  166            maxItems: 6
f668ff83b99a89 Minda Chen         2026-04-08  167  
f668ff83b99a89 Minda Chen         2026-04-08  168          clock-names:
f668ff83b99a89 Minda Chen         2026-04-08  169            minItems: 5
f668ff83b99a89 Minda Chen         2026-04-08  170            maxItems: 6
f668ff83b99a89 Minda Chen         2026-04-08  171  
23120903a5e7b0 Minda Chen         2026-04-08  172          resets:
23120903a5e7b0 Minda Chen         2026-04-08  173            maxItems: 1
23120903a5e7b0 Minda Chen         2026-04-08  174  
23120903a5e7b0 Minda Chen         2026-04-08  175          reset-names:
23120903a5e7b0 Minda Chen         2026-04-08  176            const: stmmaceth
23120903a5e7b0 Minda Chen         2026-04-08  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
