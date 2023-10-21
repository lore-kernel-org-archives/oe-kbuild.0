Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890477F4
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Oct 2023 02:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zfir07Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697854063; x=1729390063;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ReoecYGJl1G6i2ziVlo4fcuqZ/+hyimmdzhAktKw7jI=;
  b=Zfir07ReyX6VIKt+Limq5FAAotbIyJD/oj6HcGc/5ZtVUTWGPZUGckXe
   DYXgkNipMUDT3z7kTgCwumEDxQ6OlLMurK3Wd37QzNCvtfnCqRdEVUiL7
   V+xi7GtzurY3TFZM9zbS54i0XA1QWYzmF4zGDl8kTLQdia4JGG8KCS1Tm
   h+9zx4GjFlPKriYitNK2khR3xIsbpBgM8jkbJGHyK4SAv5KCOd+wbQpDD
   Pgl3oFpBj1oMeF35rLpJLsxP6IUpGq6aP0WVyazd4FHkvRzxPfQjv1xH7
   B+350U6+6gxjwmwOFbdQ74tH6Q+Ic6+UahnAoTAu1orgEM4N4I4nDvCmE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366831312"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="366831312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 19:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5543551"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 19:07:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu1Ot-0004Gb-1O;
	Sat, 21 Oct 2023 02:07:39 +0000
Date: Sat, 21 Oct 2023 10:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Add property to
 drain TX FIFO
Message-ID: <202310210939.EBd5XuAN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml:120:5: [error] syntax error: could not find expected ':' (syntax)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231016013207.2249946-3-richard.laing@alliedtelesis.co.nz>
References: <20231016013207.2249946-3-richard.laing@alliedtelesis.co.nz>
TO: Richard Laing <richard.laing@alliedtelesis.co.nz>
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: ilpo.jarvinen@linux.intel.com
TO: andriy.shevchenko@linux.intel.com
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Richard Laing <richard.laing@alliedtelesis.co.nz>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus robh/for-next linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Laing/dt-bindings-serial-snps-dw-apb-uart-Add-property-to-drain-TX-FIFO/20231017-133741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231016013207.2249946-3-richard.laing%40alliedtelesis.co.nz
patch subject: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Add property to drain TX FIFO
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210939.EBd5XuAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310210939.EBd5XuAN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml:120:5: [error] syntax error: could not find expected ':' (syntax)
--
>> Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml:120:5: could not find expected ':'
--
>> Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml: ignoring, error parsing file

vim +120 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml

df230079140f83 Rob Herring          2019-01-14    8  
df230079140f83 Rob Herring          2019-01-14    9  maintainers:
df230079140f83 Rob Herring          2019-01-14   10    - Rob Herring <robh@kernel.org>
df230079140f83 Rob Herring          2019-01-14   11  
df230079140f83 Rob Herring          2019-01-14   12  allOf:
8f082dcf2c3dad Zhen Lei             2021-05-06   13    - $ref: serial.yaml#
df230079140f83 Rob Herring          2019-01-14   14  
df230079140f83 Rob Herring          2019-01-14   15  properties:
df230079140f83 Rob Herring          2019-01-14   16    compatible:
df230079140f83 Rob Herring          2019-01-14   17      oneOf:
896efccfcc7ff9 Rob Herring          2019-01-14   18        - items:
896efccfcc7ff9 Rob Herring          2019-01-14   19            - enum:
896efccfcc7ff9 Rob Herring          2019-01-14   20                - renesas,r9a06g032-uart
896efccfcc7ff9 Rob Herring          2019-01-14   21                - renesas,r9a06g033-uart
896efccfcc7ff9 Rob Herring          2019-01-14   22            - const: renesas,rzn1-uart
df230079140f83 Rob Herring          2019-01-14   23        - items:
df230079140f83 Rob Herring          2019-01-14   24            - enum:
df230079140f83 Rob Herring          2019-01-14   25                - rockchip,px30-uart
1d751b04a49dd7 Andreas Färber       2021-05-17   26                - rockchip,rk1808-uart
df230079140f83 Rob Herring          2019-01-14   27                - rockchip,rk3036-uart
df230079140f83 Rob Herring          2019-01-14   28                - rockchip,rk3066-uart
007b20e9ec8d8f Johan Jonker         2022-09-10   29                - rockchip,rk3128-uart
df230079140f83 Rob Herring          2019-01-14   30                - rockchip,rk3188-uart
df230079140f83 Rob Herring          2019-01-14   31                - rockchip,rk3288-uart
ae9fdd23e62849 Johan Jonker         2020-03-02   32                - rockchip,rk3308-uart
df230079140f83 Rob Herring          2019-01-14   33                - rockchip,rk3328-uart
df230079140f83 Rob Herring          2019-01-14   34                - rockchip,rk3368-uart
df230079140f83 Rob Herring          2019-01-14   35                - rockchip,rk3399-uart
52008ebd62adc4 Liang Chen           2021-04-29   36                - rockchip,rk3568-uart
1fce2867c7cb14 Sebastian Reichel    2022-06-23   37                - rockchip,rk3588-uart
df230079140f83 Rob Herring          2019-01-14   38                - rockchip,rv1108-uart
0f42d7f23fd9be Jagan Teki           2022-07-24   39                - rockchip,rv1126-uart
df230079140f83 Rob Herring          2019-01-14   40            - const: snps,dw-apb-uart
df230079140f83 Rob Herring          2019-01-14   41        - items:
df230079140f83 Rob Herring          2019-01-14   42            - enum:
df230079140f83 Rob Herring          2019-01-14   43                - brcm,bcm11351-dw-apb-uart
df230079140f83 Rob Herring          2019-01-14   44                - brcm,bcm21664-dw-apb-uart
df230079140f83 Rob Herring          2019-01-14   45            - const: snps,dw-apb-uart
d0b65b1500973f Emil Renner Berthing 2021-10-07   46        - items:
d0b65b1500973f Emil Renner Berthing 2021-10-07   47            - enum:
d0b65b1500973f Emil Renner Berthing 2021-10-07   48                - starfive,jh7100-hsuart
d0b65b1500973f Emil Renner Berthing 2021-10-07   49                - starfive,jh7100-uart
d0b65b1500973f Emil Renner Berthing 2021-10-07   50            - const: snps,dw-apb-uart
df230079140f83 Rob Herring          2019-01-14   51        - const: snps,dw-apb-uart
df230079140f83 Rob Herring          2019-01-14   52  
df230079140f83 Rob Herring          2019-01-14   53    reg:
df230079140f83 Rob Herring          2019-01-14   54      maxItems: 1
df230079140f83 Rob Herring          2019-01-14   55  
df230079140f83 Rob Herring          2019-01-14   56    interrupts:
df230079140f83 Rob Herring          2019-01-14   57      maxItems: 1
df230079140f83 Rob Herring          2019-01-14   58  
df230079140f83 Rob Herring          2019-01-14   59    clock-frequency: true
df230079140f83 Rob Herring          2019-01-14   60  
df230079140f83 Rob Herring          2019-01-14   61    clocks:
df230079140f83 Rob Herring          2019-01-14   62      minItems: 1
df230079140f83 Rob Herring          2019-01-14   63      maxItems: 2
df230079140f83 Rob Herring          2019-01-14   64  
df230079140f83 Rob Herring          2019-01-14   65    clock-names:
df230079140f83 Rob Herring          2019-01-14   66      items:
df230079140f83 Rob Herring          2019-01-14   67        - const: baudclk
df230079140f83 Rob Herring          2019-01-14   68        - const: apb_pclk
df230079140f83 Rob Herring          2019-01-14   69  
370f696e44745b Conor Dooley         2023-02-08   70    dmas:
dedd376e0c7096 Krzysztof Kozlowski  2023-03-17   71      maxItems: 2
370f696e44745b Conor Dooley         2023-02-08   72  
370f696e44745b Conor Dooley         2023-02-08   73    dma-names:
370f696e44745b Conor Dooley         2023-02-08   74      items:
370f696e44745b Conor Dooley         2023-02-08   75        - const: tx
ec956e2c6f4e65 Cristian Ciocaltea   2023-03-21   76        - const: rx
370f696e44745b Conor Dooley         2023-02-08   77  
df230079140f83 Rob Herring          2019-01-14   78    snps,uart-16550-compatible:
df230079140f83 Rob Herring          2019-01-14   79      description: reflects the value of UART_16550_COMPATIBLE configuration
df230079140f83 Rob Herring          2019-01-14   80        parameter. Define this if your UART does not implement the busy functionality.
df230079140f83 Rob Herring          2019-01-14   81      type: boolean
df230079140f83 Rob Herring          2019-01-14   82  
df230079140f83 Rob Herring          2019-01-14   83    resets:
df230079140f83 Rob Herring          2019-01-14   84      maxItems: 1
df230079140f83 Rob Herring          2019-01-14   85  
df230079140f83 Rob Herring          2019-01-14   86    reg-shift: true
df230079140f83 Rob Herring          2019-01-14   87  
df230079140f83 Rob Herring          2019-01-14   88    reg-io-width: true
df230079140f83 Rob Herring          2019-01-14   89  
df230079140f83 Rob Herring          2019-01-14   90    dcd-override:
df230079140f83 Rob Herring          2019-01-14   91      description: Override the DCD modem status signal. This signal will
df230079140f83 Rob Herring          2019-01-14   92        always be reported as active instead of being obtained from the modem
df230079140f83 Rob Herring          2019-01-14   93        status register. Define this if your serial port does not use this
df230079140f83 Rob Herring          2019-01-14   94        pin.
df230079140f83 Rob Herring          2019-01-14   95      type: boolean
df230079140f83 Rob Herring          2019-01-14   96  
df230079140f83 Rob Herring          2019-01-14   97    dsr-override:
df230079140f83 Rob Herring          2019-01-14   98      description: Override the DTS modem status signal. This signal will
df230079140f83 Rob Herring          2019-01-14   99        always be reported as active instead of being obtained from the modem
df230079140f83 Rob Herring          2019-01-14  100        status register. Define this if your serial port does not use this
df230079140f83 Rob Herring          2019-01-14  101        pin.
df230079140f83 Rob Herring          2019-01-14  102      type: boolean
df230079140f83 Rob Herring          2019-01-14  103  
df230079140f83 Rob Herring          2019-01-14  104    cts-override:
df230079140f83 Rob Herring          2019-01-14  105      description: Override the CTS modem status signal. This signal will
df230079140f83 Rob Herring          2019-01-14  106        always be reported as active instead of being obtained from the modem
df230079140f83 Rob Herring          2019-01-14  107        status register. Define this if your serial port does not use this
df230079140f83 Rob Herring          2019-01-14  108        pin.
df230079140f83 Rob Herring          2019-01-14  109      type: boolean
df230079140f83 Rob Herring          2019-01-14  110  
df230079140f83 Rob Herring          2019-01-14  111    ri-override:
df230079140f83 Rob Herring          2019-01-14  112      description: Override the RI modem status signal. This signal will always
df230079140f83 Rob Herring          2019-01-14  113        be reported as inactive instead of being obtained from the modem status
df230079140f83 Rob Herring          2019-01-14  114        register. Define this if your serial port does not use this pin.
df230079140f83 Rob Herring          2019-01-14  115      type: boolean
df230079140f83 Rob Herring          2019-01-14  116  
df2cb011fd5510 Richard Laing        2023-10-16  117    drain-before-lcr-change:
df2cb011fd5510 Richard Laing        2023-10-16  118      description: Force TX buffer flush before LCR change. Make sure all
df2cb011fd5510 Richard Laing        2023-10-16  119      characters in the buffer are sent before reconfiguring. Define this if
df2cb011fd5510 Richard Laing        2023-10-16 @120      the UART drops its FIFO when reconfiguring.
df2cb011fd5510 Richard Laing        2023-10-16  121      type: boolean
df2cb011fd5510 Richard Laing        2023-10-16  122  
df230079140f83 Rob Herring          2019-01-14  123  required:
df230079140f83 Rob Herring          2019-01-14  124    - compatible
df230079140f83 Rob Herring          2019-01-14  125    - reg
df230079140f83 Rob Herring          2019-01-14  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
