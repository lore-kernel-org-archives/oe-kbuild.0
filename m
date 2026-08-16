Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D84B04A8
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786840575; cv=none; b=uXT5RAYHu0di9gzErJkPzGZiL9X+97kkzyNkU7b/JPay/mdLAoJaw3vfcTsWWSr3yM/qPGj/bGwocnw5Mujr2c6moeCELwJVfO+qDJhkmckajzRJ/V4GQH5asW70svA6n0E7ZrpO+xlbEhhe2kKWPr7Ayxla5i+IKlj7J1I+/nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786840575; c=relaxed/simple;
	bh=FEVhkg6jNFNDjJM544SsWe+GQ6tFLgWz32VKsbIywJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l83PmED+mjoCecS7PzMvRm9T/FkRLYAUVsnsfaz5HphcGFUox707VzzvPNmkW9d1q9oX/2CaIZGyeUbJfoqQ2oTxJW8U4y9A+Hr3g2dVFDNjE2xq6f8BDdI2PuNrnuU0LXAu0sEcrn3g/aPN/+0neRV665OnMtVc061ElHN0Kzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/CoKdF5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/CoKdF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786840572; x=1818376572;
  h=date:from:to:cc:subject:message-id;
  bh=FEVhkg6jNFNDjJM544SsWe+GQ6tFLgWz32VKsbIywJQ=;
  b=Z/CoKdF5peeYZUXtN7zPdst8xJI841Rae+Rek4bQAo0eVUuLrv2j5E3H
   krZ/QmRGFLle16dYHlykbDp7VTV+6BdV+daj3pluZWyJNAlh/X0EcLJC1
   5VNVqQXyGntVROwVD95ZqGDJoJIGG5A2bHJF7R2aIANm71XcK/jFG3JQk
   WYTSq73s5RUNkHNCINyX+f7LedxdcM+2FUdhwGkDUl6Xd30kP5o/YNG71
   fF/k3ao27WXAvonk9axYMDsQwcru2AZevG8VkuncmDFtgdvUraIPpeVKq
   92Cc2y5ILDkaJoGfc2E/ayhx4d5CB6XhtAURMxKEF067GtFEOTYSQ78b7
   w==;
X-CSE-ConnectionGUID: gyviQj+OQXa8M/xPyQn0NA==
X-CSE-MsgGUID: lBtTQvs8RfyFrIMRQ5qvhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="74901178"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="74901178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 17:36:12 -0700
X-CSE-ConnectionGUID: 6Gr/gh5ASHSojC6KVHK9EA==
X-CSE-MsgGUID: bozioMdWRFWLwl6nBPcZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="263228172"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Aug 2026 17:36:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvOrA-000000006WN-2OYc;
	Sun, 16 Aug 2026 00:36:08 +0000
Date: Sun, 16 Aug 2026 02:35:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:agilex5_edac_v2 4/7]
 Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml:287:12:
 [warning] wrong indentation: expected 12 but found 11 (indentation)
Message-ID: <202608160239.dlCYiuk0-lkp@intel.com>
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
TO: Dinh Nguyen <dinguyen@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git agilex5_edac_v2
head:   2f6f54c923312196982ca95d84eacc0f23e7d61b
commit: 5cbe1394ab753f3ff070332e1f151c09e57f3f14 [4/7] dt-bindings
:::::: branch date: 4 days ago
:::::: commit date: 4 weeks ago
config: arc-randconfig-2051-20260815 (https://download.01.org/0day-ci/archive/20260816/202608160239.dlCYiuk0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160239.dlCYiuk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160239.dlCYiuk0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml:287:12: [warning] wrong indentation: expected 12 but found 11 (indentation)

vim +287 Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml

dd7af147956829 Matthew Gerlach     2025-03-25    9  
dd7af147956829 Matthew Gerlach     2025-03-25   10  maintainers:
d2d3d76e740912 Niravkumar L Rabara 2025-10-17   11    - Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
dd7af147956829 Matthew Gerlach     2025-03-25   12  
dd7af147956829 Matthew Gerlach     2025-03-25   13  description:
dd7af147956829 Matthew Gerlach     2025-03-25   14    This binding describes the device tree nodes required for the Altera SoCFPGA
dd7af147956829 Matthew Gerlach     2025-03-25   15    ECC Manager for the Cyclone5, Arria5, Arria10, Stratix10, and Agilex chip
dd7af147956829 Matthew Gerlach     2025-03-25   16    families.
dd7af147956829 Matthew Gerlach     2025-03-25   17  
dd7af147956829 Matthew Gerlach     2025-03-25   18  properties:
dd7af147956829 Matthew Gerlach     2025-03-25   19  
dd7af147956829 Matthew Gerlach     2025-03-25   20    compatible:
dd7af147956829 Matthew Gerlach     2025-03-25   21      oneOf:
dd7af147956829 Matthew Gerlach     2025-03-25   22        - items:
dd7af147956829 Matthew Gerlach     2025-03-25   23            - const: altr,socfpga-s10-ecc-manager
dd7af147956829 Matthew Gerlach     2025-03-25   24            - const: altr,socfpga-a10-ecc-manager
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   25        - items:
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   26            - const: altr,socfpga-agilex5-ecc-manager
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   27            - const: altr,socfpga-a10-ecc-manager
dd7af147956829 Matthew Gerlach     2025-03-25   28        - const: altr,socfpga-a10-ecc-manager
dd7af147956829 Matthew Gerlach     2025-03-25   29        - const: altr,socfpga-ecc-manager
dd7af147956829 Matthew Gerlach     2025-03-25   30  
dd7af147956829 Matthew Gerlach     2025-03-25   31    "#address-cells":
dd7af147956829 Matthew Gerlach     2025-03-25   32      const: 1
dd7af147956829 Matthew Gerlach     2025-03-25   33  
dd7af147956829 Matthew Gerlach     2025-03-25   34    "#size-cells":
dd7af147956829 Matthew Gerlach     2025-03-25   35      const: 1
dd7af147956829 Matthew Gerlach     2025-03-25   36  
dd7af147956829 Matthew Gerlach     2025-03-25   37    interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25   38      minItems: 1
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   39      items:
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   40        - description: Global single-bit error
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   41        - description: Global double-bit error
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   42        - description: IO96B0 DRAM controller error
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   43        - description: IO96B1 DRAM controller error
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   44        - description: SDM QSPI single-bit error
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   45        - description: SDM QSPI double-bit error
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   46        - description: SDM single-event
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   47  
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   48    interrupt-names:
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   49      minItems: 1
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   50      items:
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   51        - const: global_sbe
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   52        - const: global_dbe
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   53        - const: io96b0
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   54        - const: io96b1
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   55        - const: sdm_qspi_sbe
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   56        - const: sdm_qspi_dbe
9e499ffb5e8c2a Dinh Nguyen         2025-04-15   57        - const: sdm_seu
dd7af147956829 Matthew Gerlach     2025-03-25   58  
dd7af147956829 Matthew Gerlach     2025-03-25   59    interrupt-controller: true
dd7af147956829 Matthew Gerlach     2025-03-25   60  
dd7af147956829 Matthew Gerlach     2025-03-25   61    "#interrupt-cells":
dd7af147956829 Matthew Gerlach     2025-03-25   62      const: 2
dd7af147956829 Matthew Gerlach     2025-03-25   63  
dd7af147956829 Matthew Gerlach     2025-03-25   64    ranges: true
dd7af147956829 Matthew Gerlach     2025-03-25   65  
dd7af147956829 Matthew Gerlach     2025-03-25   66    altr,sysmgr-syscon:
dd7af147956829 Matthew Gerlach     2025-03-25   67      $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25   68      description: phandle to Stratix10 System Manager Block with the ECC manager registers
dd7af147956829 Matthew Gerlach     2025-03-25   69  
dd7af147956829 Matthew Gerlach     2025-03-25   70    sdramedac:
dd7af147956829 Matthew Gerlach     2025-03-25   71      type: object
dd7af147956829 Matthew Gerlach     2025-03-25   72      additionalProperties: false
dd7af147956829 Matthew Gerlach     2025-03-25   73  
dd7af147956829 Matthew Gerlach     2025-03-25   74      properties:
dd7af147956829 Matthew Gerlach     2025-03-25   75        compatible:
dd7af147956829 Matthew Gerlach     2025-03-25   76          enum:
129b91fc329604 Rob Herring (Arm    2025-09-26   77)           - altr,sdram-edac
dd7af147956829 Matthew Gerlach     2025-03-25   78            - altr,sdram-edac-a10
dd7af147956829 Matthew Gerlach     2025-03-25   79            - altr,sdram-edac-s10
dd7af147956829 Matthew Gerlach     2025-03-25   80  
dd7af147956829 Matthew Gerlach     2025-03-25   81        interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25   82          minItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25   83          maxItems: 2
dd7af147956829 Matthew Gerlach     2025-03-25   84  
dd7af147956829 Matthew Gerlach     2025-03-25   85        altr,sdr-syscon:
dd7af147956829 Matthew Gerlach     2025-03-25   86          $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25   87          description: phandle to SDRAM parent
dd7af147956829 Matthew Gerlach     2025-03-25   88  
dd7af147956829 Matthew Gerlach     2025-03-25   89      required:
dd7af147956829 Matthew Gerlach     2025-03-25   90        - compatible
dd7af147956829 Matthew Gerlach     2025-03-25   91        - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25   92        - altr,sdr-syscon
dd7af147956829 Matthew Gerlach     2025-03-25   93  
dd7af147956829 Matthew Gerlach     2025-03-25   94  patternProperties:
dd7af147956829 Matthew Gerlach     2025-03-25   95    "^ocram-ecc@[a-f0-9]+$":
dd7af147956829 Matthew Gerlach     2025-03-25   96      type: object
dd7af147956829 Matthew Gerlach     2025-03-25   97      additionalProperties: false
dd7af147956829 Matthew Gerlach     2025-03-25   98  
dd7af147956829 Matthew Gerlach     2025-03-25   99      properties:
dd7af147956829 Matthew Gerlach     2025-03-25  100        compatible:
dd7af147956829 Matthew Gerlach     2025-03-25  101          oneOf:
dd7af147956829 Matthew Gerlach     2025-03-25  102            - items:
dd7af147956829 Matthew Gerlach     2025-03-25  103                - const: altr,socfpga-s10-ocram-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  104                - const: altr,socfpga-a10-ocram-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  105            - const: altr,socfpga-a10-ocram-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  106            - const: altr,socfpga-ocram-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  107  
dd7af147956829 Matthew Gerlach     2025-03-25  108        reg:
dd7af147956829 Matthew Gerlach     2025-03-25  109          maxItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  110  
dd7af147956829 Matthew Gerlach     2025-03-25  111        interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25  112          minItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  113          maxItems: 2
dd7af147956829 Matthew Gerlach     2025-03-25  114  
dd7af147956829 Matthew Gerlach     2025-03-25  115        iram:
dd7af147956829 Matthew Gerlach     2025-03-25  116          $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25  117          description: phandle to OCRAM parent
dd7af147956829 Matthew Gerlach     2025-03-25  118  
dd7af147956829 Matthew Gerlach     2025-03-25  119        altr,ecc-parent:
dd7af147956829 Matthew Gerlach     2025-03-25  120          $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25  121          description: phandle to OCRAM parent
dd7af147956829 Matthew Gerlach     2025-03-25  122  
dd7af147956829 Matthew Gerlach     2025-03-25  123      required:
dd7af147956829 Matthew Gerlach     2025-03-25  124        - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  125        - reg
dd7af147956829 Matthew Gerlach     2025-03-25  126        - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25  127  
dd7af147956829 Matthew Gerlach     2025-03-25  128    "^usb[0-9]-ecc@[a-f0-9]+$":
dd7af147956829 Matthew Gerlach     2025-03-25  129      type: object
dd7af147956829 Matthew Gerlach     2025-03-25  130      additionalProperties: false
dd7af147956829 Matthew Gerlach     2025-03-25  131  
dd7af147956829 Matthew Gerlach     2025-03-25  132      properties:
dd7af147956829 Matthew Gerlach     2025-03-25  133        compatible:
dd7af147956829 Matthew Gerlach     2025-03-25  134          oneOf:
dd7af147956829 Matthew Gerlach     2025-03-25  135            - items:
dd7af147956829 Matthew Gerlach     2025-03-25  136                - const: altr,socfpga-s10-usb-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  137                - const: altr,socfpga-usb-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  138            - const: altr,socfpga-usb-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  139  
dd7af147956829 Matthew Gerlach     2025-03-25  140        reg:
dd7af147956829 Matthew Gerlach     2025-03-25  141          maxItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  142  
dd7af147956829 Matthew Gerlach     2025-03-25  143        interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25  144          minItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  145          maxItems: 2
dd7af147956829 Matthew Gerlach     2025-03-25  146  
dd7af147956829 Matthew Gerlach     2025-03-25  147        altr,ecc-parent:
dd7af147956829 Matthew Gerlach     2025-03-25  148          $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25  149          description: phandle to USB parent
dd7af147956829 Matthew Gerlach     2025-03-25  150  
dd7af147956829 Matthew Gerlach     2025-03-25  151      required:
dd7af147956829 Matthew Gerlach     2025-03-25  152        - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  153        - reg
dd7af147956829 Matthew Gerlach     2025-03-25  154        - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25  155        - altr,ecc-parent
dd7af147956829 Matthew Gerlach     2025-03-25  156  
dd7af147956829 Matthew Gerlach     2025-03-25  157    "^emac[0-9]-[t,r]x-ecc@[a-f0-9]+$":
dd7af147956829 Matthew Gerlach     2025-03-25  158      type: object
dd7af147956829 Matthew Gerlach     2025-03-25  159      additionalProperties: false
dd7af147956829 Matthew Gerlach     2025-03-25  160  
dd7af147956829 Matthew Gerlach     2025-03-25  161      properties:
dd7af147956829 Matthew Gerlach     2025-03-25  162        compatible:
dd7af147956829 Matthew Gerlach     2025-03-25  163          oneOf:
dd7af147956829 Matthew Gerlach     2025-03-25  164            - items:
dd7af147956829 Matthew Gerlach     2025-03-25  165                - const: altr,socfpga-s10-eth-mac-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  166                - const: altr,socfpga-eth-mac-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  167            - const: altr,socfpga-eth-mac-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  168  
dd7af147956829 Matthew Gerlach     2025-03-25  169        reg:
dd7af147956829 Matthew Gerlach     2025-03-25  170          maxItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  171  
dd7af147956829 Matthew Gerlach     2025-03-25  172        interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25  173          minItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  174          maxItems: 2
dd7af147956829 Matthew Gerlach     2025-03-25  175  
dd7af147956829 Matthew Gerlach     2025-03-25  176        altr,ecc-parent:
dd7af147956829 Matthew Gerlach     2025-03-25  177          $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25  178          description: phandle to ethernet parent
dd7af147956829 Matthew Gerlach     2025-03-25  179  
dd7af147956829 Matthew Gerlach     2025-03-25  180      required:
dd7af147956829 Matthew Gerlach     2025-03-25  181        - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  182        - reg
dd7af147956829 Matthew Gerlach     2025-03-25  183        - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25  184        - altr,ecc-parent
dd7af147956829 Matthew Gerlach     2025-03-25  185  
dd7af147956829 Matthew Gerlach     2025-03-25  186    "^sdmmc[a-f]-ecc@[a-f0-9]+$":
dd7af147956829 Matthew Gerlach     2025-03-25  187      type: object
dd7af147956829 Matthew Gerlach     2025-03-25  188      additionalProperties: false
dd7af147956829 Matthew Gerlach     2025-03-25  189  
dd7af147956829 Matthew Gerlach     2025-03-25  190      properties:
dd7af147956829 Matthew Gerlach     2025-03-25  191        compatible:
dd7af147956829 Matthew Gerlach     2025-03-25  192          oneOf:
dd7af147956829 Matthew Gerlach     2025-03-25  193            - items:
dd7af147956829 Matthew Gerlach     2025-03-25  194                - const: altr,socfpga-s10-sdmmc-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  195                - const: altr,socfpga-sdmmc-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  196            - const: altr,socfpga-sdmmc-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  197  
dd7af147956829 Matthew Gerlach     2025-03-25  198        reg:
dd7af147956829 Matthew Gerlach     2025-03-25  199          maxItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  200  
dd7af147956829 Matthew Gerlach     2025-03-25  201        interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25  202          minItems: 2
dd7af147956829 Matthew Gerlach     2025-03-25  203          maxItems: 4
dd7af147956829 Matthew Gerlach     2025-03-25  204  
dd7af147956829 Matthew Gerlach     2025-03-25  205        altr,ecc-parent:
dd7af147956829 Matthew Gerlach     2025-03-25  206          $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25  207          description: phandle to SD/MMC parent
dd7af147956829 Matthew Gerlach     2025-03-25  208  
dd7af147956829 Matthew Gerlach     2025-03-25  209      required:
dd7af147956829 Matthew Gerlach     2025-03-25  210        - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  211        - reg
dd7af147956829 Matthew Gerlach     2025-03-25  212        - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25  213        - altr,ecc-parent
dd7af147956829 Matthew Gerlach     2025-03-25  214  
dd7af147956829 Matthew Gerlach     2025-03-25  215    "^l2-ecc@[a-f0-9]+$":
dd7af147956829 Matthew Gerlach     2025-03-25  216      type: object
dd7af147956829 Matthew Gerlach     2025-03-25  217      additionalProperties: false
dd7af147956829 Matthew Gerlach     2025-03-25  218  
dd7af147956829 Matthew Gerlach     2025-03-25  219      properties:
dd7af147956829 Matthew Gerlach     2025-03-25  220        compatible:
dd7af147956829 Matthew Gerlach     2025-03-25  221          enum:
dd7af147956829 Matthew Gerlach     2025-03-25  222            - altr,socfpga-a10-l2-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  223            - altr,socfpga-l2-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  224  
dd7af147956829 Matthew Gerlach     2025-03-25  225        reg:
dd7af147956829 Matthew Gerlach     2025-03-25  226          maxItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  227  
dd7af147956829 Matthew Gerlach     2025-03-25  228        interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25  229          maxItems: 2
dd7af147956829 Matthew Gerlach     2025-03-25  230  
dd7af147956829 Matthew Gerlach     2025-03-25  231      required:
dd7af147956829 Matthew Gerlach     2025-03-25  232        - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  233        - reg
dd7af147956829 Matthew Gerlach     2025-03-25  234        - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25  235  
dd7af147956829 Matthew Gerlach     2025-03-25  236    "^dma-ecc@[a-f0-9]+$":
dd7af147956829 Matthew Gerlach     2025-03-25  237      type: object
dd7af147956829 Matthew Gerlach     2025-03-25  238      additionalProperties: false
dd7af147956829 Matthew Gerlach     2025-03-25  239  
dd7af147956829 Matthew Gerlach     2025-03-25  240      properties:
dd7af147956829 Matthew Gerlach     2025-03-25  241        compatible:
dd7af147956829 Matthew Gerlach     2025-03-25  242          const: altr,socfpga-dma-ecc
dd7af147956829 Matthew Gerlach     2025-03-25  243        reg:
dd7af147956829 Matthew Gerlach     2025-03-25  244          maxItems: 1
dd7af147956829 Matthew Gerlach     2025-03-25  245  
dd7af147956829 Matthew Gerlach     2025-03-25  246        interrupts:
dd7af147956829 Matthew Gerlach     2025-03-25  247          maxItems: 2
dd7af147956829 Matthew Gerlach     2025-03-25  248  
dd7af147956829 Matthew Gerlach     2025-03-25  249        altr,ecc-parent:
dd7af147956829 Matthew Gerlach     2025-03-25  250          $ref: /schemas/types.yaml#/definitions/phandle
dd7af147956829 Matthew Gerlach     2025-03-25  251          description: phandle to SD/MMC parent
dd7af147956829 Matthew Gerlach     2025-03-25  252  
dd7af147956829 Matthew Gerlach     2025-03-25  253      required:
dd7af147956829 Matthew Gerlach     2025-03-25  254        - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  255        - reg
dd7af147956829 Matthew Gerlach     2025-03-25  256        - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25  257        - altr,ecc-parent
dd7af147956829 Matthew Gerlach     2025-03-25  258  
5cbe1394ab753f Dinh Nguyen         2026-07-21  259  allOf:
5cbe1394ab753f Dinh Nguyen         2026-07-21  260    - if:
dd7af147956829 Matthew Gerlach     2025-03-25  261        properties:
dd7af147956829 Matthew Gerlach     2025-03-25  262          compatible:
dd7af147956829 Matthew Gerlach     2025-03-25  263            contains:
dd7af147956829 Matthew Gerlach     2025-03-25  264              const: altr,socfpga-ecc-manager
dd7af147956829 Matthew Gerlach     2025-03-25  265      then:
dd7af147956829 Matthew Gerlach     2025-03-25  266        required:
dd7af147956829 Matthew Gerlach     2025-03-25  267          - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  268          - "#address-cells"
dd7af147956829 Matthew Gerlach     2025-03-25  269          - "#size-cells"
dd7af147956829 Matthew Gerlach     2025-03-25  270          - ranges
dd7af147956829 Matthew Gerlach     2025-03-25  271  
dd7af147956829 Matthew Gerlach     2025-03-25  272      else:
dd7af147956829 Matthew Gerlach     2025-03-25  273        required:
dd7af147956829 Matthew Gerlach     2025-03-25  274          - compatible
dd7af147956829 Matthew Gerlach     2025-03-25  275          - "#address-cells"
dd7af147956829 Matthew Gerlach     2025-03-25  276          - "#size-cells"
dd7af147956829 Matthew Gerlach     2025-03-25  277          - interrupts
dd7af147956829 Matthew Gerlach     2025-03-25  278          - interrupt-controller
dd7af147956829 Matthew Gerlach     2025-03-25  279          - "#interrupt-cells"
dd7af147956829 Matthew Gerlach     2025-03-25  280          - ranges
dd7af147956829 Matthew Gerlach     2025-03-25  281          - altr,sysmgr-syscon
dd7af147956829 Matthew Gerlach     2025-03-25  282  
5cbe1394ab753f Dinh Nguyen         2026-07-21  283    - if:
5cbe1394ab753f Dinh Nguyen         2026-07-21  284        properties:
5cbe1394ab753f Dinh Nguyen         2026-07-21  285          compatible:
5cbe1394ab753f Dinh Nguyen         2026-07-21  286            contains:
5cbe1394ab753f Dinh Nguyen         2026-07-21 @287             const: altr,socfpga-agilex5-ecc-manager
5cbe1394ab753f Dinh Nguyen         2026-07-21  288      then:
5cbe1394ab753f Dinh Nguyen         2026-07-21  289        properties:
5cbe1394ab753f Dinh Nguyen         2026-07-21  290          interrupts:
5cbe1394ab753f Dinh Nguyen         2026-07-21  291            maxItems: 7
5cbe1394ab753f Dinh Nguyen         2026-07-21  292        required:
5cbe1394ab753f Dinh Nguyen         2026-07-21  293          - reset-names
5cbe1394ab753f Dinh Nguyen         2026-07-21  294      else:
5cbe1394ab753f Dinh Nguyen         2026-07-21  295        properties:
5cbe1394ab753f Dinh Nguyen         2026-07-21  296          interrupts:
5cbe1394ab753f Dinh Nguyen         2026-07-21  297            maxItems: 2
5cbe1394ab753f Dinh Nguyen         2026-07-21  298  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
