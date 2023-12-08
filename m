Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966ED1B279
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/i8UiKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702035986; x=1733571986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXW7mUp9Nold/TBIyVzJ7BS6klDf66svHF927pcsDBc=;
  b=T/i8UiKhZXlhr8xWcYERuV3n0fhSVOIZfJze5diCJqH0p2jesJ6S98C1
   gaHvMb6lbv21rENsni+X9PiBP3fezsMzMfGQMniJT/UfMQGv06MHR1OZu
   24zlUsU7MqO//KuxR9W9MHNg96mNjxU9gGEDLIcNNvrqbwihkCqp2NHxi
   73SN5MfJl/KhfoMb8PNOC3AZImQ3IBZ440X+44QP4XlO0Ez1mpDz1DT7M
   VKXZqnGdreawub2znJAiJ9UxMJruJLJNHygfIP/Qf6hHCH7QxlvqMLB+H
   N5CiCi87RxfOBwVClGIBGy+p5NPtJyi9ZdDOSbAfkUnJZ8G/kNFK67dGR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394134582"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="394134582"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765466195"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="765466195"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 08 Dec 2023 03:46:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBZJ2-000DgV-25;
	Fri, 08 Dec 2023 11:46:08 +0000
Date: Fri, 8 Dec 2023 19:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <202312081933.MUdHNASt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang@outlook.com>
References: <d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang@outlook.com>
TO: Chen Wang <unicornxw@gmail.com>
TO: aou@eecs.berkeley.edu
TO: chao.wei@sophgo.com
TO: conor@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: mturquette@baylibre.com
TO: palmer@dabbelt.com
TO: paul.walmsley@sifive.com
TO: richardcochran@gmail.com
TO: robh+dt@kernel.org
TO: sboyd@kernel.org
TO: devicetree@vger.kernel.org
TO: linux-clk@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-riscv@lists.infradead.org
TO: haijiao.liu@sophgo.com
TO: xiaoguang.xing@sophgo.com
TO: guoren@kernel.org
TO: jszhang@kernel.org
TO: inochiama@outlook.com
TO: samuel.holland@sifive.com
CC: Chen Wang <unicorn_wang@outlook.com>

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-soc-sophgo-Add-Sophgo-system-control-module/20231208-091702
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang%40outlook.com
patch subject: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: xtensa-randconfig-r071-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081933.MUdHNASt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312081933.MUdHNASt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312081933.MUdHNASt-lkp@intel.com/

smatch warnings:
drivers/clk/sophgo/clk-sophgo-sg2042.c:1282 sg2042_clk_init_clk_data() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1282 drivers/clk/sophgo/clk-sophgo-sg2042.c

7c68ebea1041f9 Chen Wang 2023-12-08  1257  
7c68ebea1041f9 Chen Wang 2023-12-08  1258  static int __init sg2042_clk_init_clk_data(
7c68ebea1041f9 Chen Wang 2023-12-08  1259  	struct device_node *node,
7c68ebea1041f9 Chen Wang 2023-12-08  1260  	int num_clks,
7c68ebea1041f9 Chen Wang 2023-12-08  1261  	struct sg2042_clk_data **pp_clk_data)
7c68ebea1041f9 Chen Wang 2023-12-08  1262  {
7c68ebea1041f9 Chen Wang 2023-12-08  1263  	int ret = 0;
7c68ebea1041f9 Chen Wang 2023-12-08  1264  	struct sg2042_clk_data *clk_data = NULL;
7c68ebea1041f9 Chen Wang 2023-12-08  1265  	struct device_node *np_syscon;
7c68ebea1041f9 Chen Wang 2023-12-08  1266  
7c68ebea1041f9 Chen Wang 2023-12-08  1267  	np_syscon = of_parse_phandle(node, "sophgo,system-ctrl", 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1268  	if (!np_syscon) {
7c68ebea1041f9 Chen Wang 2023-12-08  1269  		pr_err("failed to get system-ctrl node\n");
7c68ebea1041f9 Chen Wang 2023-12-08  1270  		ret = -EINVAL;
7c68ebea1041f9 Chen Wang 2023-12-08  1271  		goto error_out;
7c68ebea1041f9 Chen Wang 2023-12-08  1272  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1273  
7c68ebea1041f9 Chen Wang 2023-12-08  1274  	clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
7c68ebea1041f9 Chen Wang 2023-12-08  1275  	if (!clk_data) {
7c68ebea1041f9 Chen Wang 2023-12-08  1276  		ret = -ENOMEM;
7c68ebea1041f9 Chen Wang 2023-12-08  1277  		goto error_out;
7c68ebea1041f9 Chen Wang 2023-12-08  1278  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1279  
7c68ebea1041f9 Chen Wang 2023-12-08  1280  	clk_data->regmap_syscon = device_node_to_regmap(np_syscon);
7c68ebea1041f9 Chen Wang 2023-12-08  1281  	if (IS_ERR_OR_NULL(clk_data->regmap_syscon)) {
7c68ebea1041f9 Chen Wang 2023-12-08 @1282  		pr_err("cannot get regmap_syscon %ld\n", PTR_ERR(clk_data->regmap_syscon));
7c68ebea1041f9 Chen Wang 2023-12-08  1283  		ret = -ENODEV;
7c68ebea1041f9 Chen Wang 2023-12-08  1284  		goto cleanup;
7c68ebea1041f9 Chen Wang 2023-12-08  1285  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1286  	clk_data->iobase_syscon = of_iomap(np_syscon, 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1287  	clk_data->iobase = of_iomap(node, 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1288  	clk_data->onecell_data.num = num_clks;
7c68ebea1041f9 Chen Wang 2023-12-08  1289  
7c68ebea1041f9 Chen Wang 2023-12-08  1290  	*pp_clk_data = clk_data;
7c68ebea1041f9 Chen Wang 2023-12-08  1291  	return ret;
7c68ebea1041f9 Chen Wang 2023-12-08  1292  
7c68ebea1041f9 Chen Wang 2023-12-08  1293  cleanup:
7c68ebea1041f9 Chen Wang 2023-12-08  1294  	kfree(clk_data);
7c68ebea1041f9 Chen Wang 2023-12-08  1295  
7c68ebea1041f9 Chen Wang 2023-12-08  1296  error_out:
7c68ebea1041f9 Chen Wang 2023-12-08  1297  	return ret;
7c68ebea1041f9 Chen Wang 2023-12-08  1298  }
7c68ebea1041f9 Chen Wang 2023-12-08  1299  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
