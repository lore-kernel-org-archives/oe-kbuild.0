Received: from out199-4.us.a.mail.aliyun.com (out199-4.us.a.mail.aliyun.com [47.90.199.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327887F;
	Sun,  6 Nov 2022 13:09:22 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VU3D5cg_1667738288;
Received: from 30.15.235.173(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0VU3D5cg_1667738288)
          by smtp.aliyun-inc.com;
          Sun, 06 Nov 2022 20:38:09 +0800
Message-ID: <97361840-0a56-f074-0495-712dafe4313d@linux.alibaba.com>
Date: Sun, 6 Nov 2022 20:38:07 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error
 code 'status'
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 Heming Zhao via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202211050722.8YGvtPaR-lkp@intel.com>
Content-Language: en-US
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <202211050722.8YGvtPaR-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/5/22 7:15 PM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   10d916c86ecafeccaed89175ebf9b832dddde380
> commit: 0737e01de9c411e4db87dcedf4a9789d41b1c5c1 ocfs2: ocfs2_mount_volume does cleanup job before return error
> config: alpha-randconfig-m041-20221030
> compiler: alpha-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error code 'status'
> 
> vim +/status +1809 fs/ocfs2/super.c
> 
> ccd979bdbce9fba Mark Fasheh                 2005-12-15  1802  
> ccd979bdbce9fba Mark Fasheh                 2005-12-15  1803  static int ocfs2_mount_volume(struct super_block *sb)
> ccd979bdbce9fba Mark Fasheh                 2005-12-15  1804  {
> ccd979bdbce9fba Mark Fasheh                 2005-12-15  1805  	int status = 0;
> ccd979bdbce9fba Mark Fasheh                 2005-12-15  1806  	struct ocfs2_super *osb = OCFS2_SB(sb);
> ccd979bdbce9fba Mark Fasheh                 2005-12-15  1807  
> ccd979bdbce9fba Mark Fasheh                 2005-12-15  1808  	if (ocfs2_is_hard_readonly(osb))
> 0737e01de9c411e Heming Zhao via Ocfs2-devel 2022-04-29 @1809  		goto out;
> 
> Unclear if this is an error path or a success path.  Honestly, I would
> have thought the checker is correct that it looks like a failure path.
> 
This indicates a readonly mount and bypasses dlm related initialization.
So it seems an expected success return.

Thanks,
Joseph
