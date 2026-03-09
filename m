Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0EF2C11DF
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076057; cv=none; b=QiOSUmwDiJiQhhoJaTDgabUJEyJoAqRyori15q0K9IIkPacKybOzBHellKhZvvK7inuuI+DhGhP2sjVqB0x4U9D6KEGRUneha6zLxdpobd6iqTCFlOoousDfOTB26iI4Eh5bBmij9csK5YXL4F4X4NHfL2TG/+gOOcPpUMnw7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076057; c=relaxed/simple;
	bh=c+vT0Pg/a2QSFo99XGKiNGkkeUmPy/hyB4gekOoCbuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFLMapiUPsj8dcWtIQ8nZm7R2Pq+03SdbSELTWWyVX1AB+4EENQ3CkDly2ORVZaT6xBttWz/rw4AOZhfYhlPTJ5yOSsF0cWde7gWZvE0ZiAIqH1AccjvZqSJD5eCyN6nJXVqknf7Gn0Qj1gQslYjGD8/6gr0h14UdaNngVOl4YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsNzteq+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsNzteq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773076053; x=1804612053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+vT0Pg/a2QSFo99XGKiNGkkeUmPy/hyB4gekOoCbuE=;
  b=jsNzteq+CYlZ3ljbtMz2/VDUwLIfR9/yWLWwcly9uOLEnrYpEqvEwdyZ
   o3VLQHj2cfxl2VCuFvm+A0Svo2x+HwVpEjfHwgZ5FAEfqfvOidoiw7B8t
   C/07Pp1f7E/JeuCFm3rFbzBIuTDP7XYk7aVNWs64Ghrxl6O+CR4alidmW
   EkpiUYLH8qMo9XadudKeHASnYSvIeponJwTyoHbeOuIFFOs2PIztslsAk
   xKsrP1h6L/t0X+z3p8wdsfRbbwVsou0+cYzYs6p9RZNG4Fwy6NYs0QXQR
   ZT1Azei13jlshfPO8m3eT+JjHqF8/CfgWiV/Ls3t/t45PC72limXi/56h
   w==;
X-CSE-ConnectionGUID: UHgjqL7hRRKEYjXJ4EX1vQ==
X-CSE-MsgGUID: 0e+aJzBhRpub8WnPDHn2NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84743806"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84743806"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 10:07:32 -0700
X-CSE-ConnectionGUID: GyVPmEyTT3i3p2AwE6yWfg==
X-CSE-MsgGUID: oEGdc6hxTOm0Xyg4HNHLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="242836712"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 Mar 2026 10:07:31 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vze4n-000000002uD-1uBA;
	Mon, 09 Mar 2026 17:07:29 +0000
Date: Mon, 9 Mar 2026 18:07:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add ITE IT6162 MIPI
 DSI to HDMI bridge
Message-ID: <202603091726.5b8momcq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260309-upstream-6162-v2-1-debdb6c88030@ite.com.tw>
References: <20260309-upstream-6162-v2-1-debdb6c88030@ite.com.tw>
TO: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Pet.Weng@ite.com.tw
CC: Kenneth.Hung@ite.com.tw
CC: Hermes Wu <Hermes.Wu@ite.com.tw>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Hermes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2622649ad6cdbb3e77bfafc8c0fe686090b77f70]

url:    https://github.com/intel-lab-lkp/linux/commits/Hermes-Wu-via-B4-Relay/dt-bindings-display-bridge-Add-ITE-IT6162-MIPI-DSI-to-HDMI-bridge/20260309-174457
base:   2622649ad6cdbb3e77bfafc8c0fe686090b77f70
patch link:    https://lore.kernel.org/r/20260309-upstream-6162-v2-1-debdb6c88030%40ite.com.tw
patch subject: [PATCH v2 1/2] dt-bindings: display: bridge: Add ITE IT6162 MIPI DSI to HDMI bridge
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arc-randconfig-2051-20260309 (https://download.01.org/0day-ci/archive/20260309/202603091726.5b8momcq-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091726.5b8momcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603091726.5b8momcq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)
>> Documentation/devicetree/bindings/display/bridge/ite,it6162.yaml:216:7: [error] no new line character at the end of file (new-line-at-end-of-file)

vim +216 Documentation/devicetree/bindings/display/bridge/ite,it6162.yaml

179a1484dad298 Hermes Wu 2026-03-09  151  
179a1484dad298 Hermes Wu 2026-03-09  152  examples:
179a1484dad298 Hermes Wu 2026-03-09  153    - |
179a1484dad298 Hermes Wu 2026-03-09  154      #include <dt-bindings/gpio/gpio.h>
179a1484dad298 Hermes Wu 2026-03-09  155      #include <dt-bindings/interrupt-controller/irq.h>
179a1484dad298 Hermes Wu 2026-03-09  156  
179a1484dad298 Hermes Wu 2026-03-09  157      i2c {
179a1484dad298 Hermes Wu 2026-03-09  158          #address-cells = <1>;
179a1484dad298 Hermes Wu 2026-03-09  159          #size-cells = <0>;
179a1484dad298 Hermes Wu 2026-03-09  160  
179a1484dad298 Hermes Wu 2026-03-09  161          bridge@58 {
179a1484dad298 Hermes Wu 2026-03-09  162              compatible = "ite,it6162";
179a1484dad298 Hermes Wu 2026-03-09  163              reg = <0x58>;
179a1484dad298 Hermes Wu 2026-03-09  164  
179a1484dad298 Hermes Wu 2026-03-09  165              #sound-dai-cells = <0>;
179a1484dad298 Hermes Wu 2026-03-09  166  
179a1484dad298 Hermes Wu 2026-03-09  167              interrupt-parent = <&pio>;
179a1484dad298 Hermes Wu 2026-03-09  168              interrupts = <128 IRQ_TYPE_LEVEL_LOW>;
179a1484dad298 Hermes Wu 2026-03-09  169  
179a1484dad298 Hermes Wu 2026-03-09  170              pinctrl-names = "default";
179a1484dad298 Hermes Wu 2026-03-09  171              pinctrl-0 = <&it6162_pins>;
179a1484dad298 Hermes Wu 2026-03-09  172  
179a1484dad298 Hermes Wu 2026-03-09  173              reset-gpios = <&pio 127 GPIO_ACTIVE_LOW>;
179a1484dad298 Hermes Wu 2026-03-09  174  
179a1484dad298 Hermes Wu 2026-03-09  175              ivdd-supply = <&pp1000_hdmi_x>;
179a1484dad298 Hermes Wu 2026-03-09  176              ovdd-supply = <&pp3300_vio28_x>;
179a1484dad298 Hermes Wu 2026-03-09  177              ovdd1833-supply = <&pp1800_vcamio_x>;
179a1484dad298 Hermes Wu 2026-03-09  178  
179a1484dad298 Hermes Wu 2026-03-09  179              ite,support-hdcp;   // HDCP enabled on this board
179a1484dad298 Hermes Wu 2026-03-09  180  
179a1484dad298 Hermes Wu 2026-03-09  181              ports {
179a1484dad298 Hermes Wu 2026-03-09  182                  #address-cells = <1>;
179a1484dad298 Hermes Wu 2026-03-09  183                  #size-cells = <0>;
179a1484dad298 Hermes Wu 2026-03-09  184  
179a1484dad298 Hermes Wu 2026-03-09  185                  port@0 {
179a1484dad298 Hermes Wu 2026-03-09  186                      reg = <0>;
179a1484dad298 Hermes Wu 2026-03-09  187                      it6162_dsi0: endpoint {
179a1484dad298 Hermes Wu 2026-03-09  188                          data-lanes = < 1 2 3 4>;
179a1484dad298 Hermes Wu 2026-03-09  189                          remote-endpoint = <&dsi_0_out>;
179a1484dad298 Hermes Wu 2026-03-09  190                      };
179a1484dad298 Hermes Wu 2026-03-09  191                  };
179a1484dad298 Hermes Wu 2026-03-09  192  
179a1484dad298 Hermes Wu 2026-03-09  193                  port@1 {
179a1484dad298 Hermes Wu 2026-03-09  194                      reg = <1>;
179a1484dad298 Hermes Wu 2026-03-09  195                      it6162_dsi1: endpoint {
179a1484dad298 Hermes Wu 2026-03-09  196                          data-lanes = < 1 2 3 4>;
179a1484dad298 Hermes Wu 2026-03-09  197                          remote-endpoint = <&dsi_1_out>;
179a1484dad298 Hermes Wu 2026-03-09  198                      };
179a1484dad298 Hermes Wu 2026-03-09  199                  };
179a1484dad298 Hermes Wu 2026-03-09  200  
179a1484dad298 Hermes Wu 2026-03-09  201                  port@2 {
179a1484dad298 Hermes Wu 2026-03-09  202                      reg = <2>;
179a1484dad298 Hermes Wu 2026-03-09  203                      it6162_audio_in: endpoint {
179a1484dad298 Hermes Wu 2026-03-09  204                          remote-endpoint = <&i2s0_out>;
179a1484dad298 Hermes Wu 2026-03-09  205                      };
179a1484dad298 Hermes Wu 2026-03-09  206                  };
179a1484dad298 Hermes Wu 2026-03-09  207  
179a1484dad298 Hermes Wu 2026-03-09  208                  port@3 {
179a1484dad298 Hermes Wu 2026-03-09  209                      reg = <3>;
179a1484dad298 Hermes Wu 2026-03-09  210                      it6162_hdmi_out: endpoint {
179a1484dad298 Hermes Wu 2026-03-09  211                          remote-endpoint = <&hdmi_connector_in>;
179a1484dad298 Hermes Wu 2026-03-09  212                      };
179a1484dad298 Hermes Wu 2026-03-09  213                  };
179a1484dad298 Hermes Wu 2026-03-09  214              };
179a1484dad298 Hermes Wu 2026-03-09  215          };
179a1484dad298 Hermes Wu 2026-03-09 @216      };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
