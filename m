Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FA5A3F;
	Fri,  9 Dec 2022 08:54:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n7so3048070wms.3;
        Fri, 09 Dec 2022 00:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiJ4fBjqA6KYONZ4698gKIS7raZeSb+QsIgRkO+sjcA=;
        b=I+rs7LO33HA2PIdNwCPZhF35ErUOWgeKEhdLuTaaTKHnTVyj+Sj1iD5ZvSsVzn8H8h
         uafrtZBuPw7rS73Mo2aWLuiuQ/YsRFlme9ppHFNJ4echa6cW2CbqcOFK2g+5b3O+YfNX
         AktD6h08GTBTmImtSsjoeV1Y0vVhNa3wPON3Uul+NJEthUGJExXkhyAxJlSFj8PSetYT
         lqXzwUB4UKiIepZxkeNTcmi+a9wjBUy+jRp8Hl30SrfyxcB9IHQMD0RI6EfyTWMRbYSi
         BhSSd6y00LgSOtPJFl7QNG3QB9EuTHA1OC4mFB7QIiSHJ7rAhR/vnblpgYNmL/iQPFds
         dj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiJ4fBjqA6KYONZ4698gKIS7raZeSb+QsIgRkO+sjcA=;
        b=mY1kHTVL2cIJl/DzLL3fGLp5YnkjCgBYJ9Qxcw1NvgQAjvMobKqBnCTKrvLqdc5nyZ
         UxoUBLGDVmBITciTQSTKG8f5rpVAZI56qQxu0VC8Ye1xvlp2wPvs69iQoRQRIQSLx7dI
         VBQxLvBJdlmDB7WndXv7cTUoR4lLaSbaYKuXKDyAYM8GFZTVqs1kUbHc2uXtYqHorjzj
         4i2Dvo8YDWHrvaMDXee1lXm+a10zuQu2CQw/deLyieTRUpdOqJkcKKKkAh8fIsIuwZay
         Vb/e3o6l/nJeqMpv5f4v2PrW/7xeeZKCNmVoppN2rM8W/xu3LSXxOo7jiR1vSTQ/RKKL
         +J6w==
X-Gm-Message-State: ANoB5pkrINNVF04CMQR2pSYz9FZKU5GMFy0oabtzanF0q5u8+TBYiZfb
	PWYu+Tw0IE08z7KvGfDcoMGsjg2gXqDRCfoA
X-Google-Smtp-Source: AA0mqf4g1Vlstpr/QLuEvkvpOhoL3hcuYUeLp1uu5LyLuzYGKgdSOCURAWEmHMN8EeEPUW8GuQMZRw==
X-Received: by 2002:a05:600c:1d09:b0:3cf:6928:581d with SMTP id l9-20020a05600c1d0900b003cf6928581dmr5280378wms.2.1670576052594;
        Fri, 09 Dec 2022 00:54:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z15-20020a7bc7cf000000b003c6c5a5a651sm1111521wmk.28.2022.12.09.00.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 00:54:12 -0800 (PST)
Date: Fri, 9 Dec 2022 11:54:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/4] net: microchip: vcap: Add vcap_get_rule
Message-ID: <202212090232.PxvdPz7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203104348.1749811-2-horatiu.vultur@microchip.com>
Message-ID: <20221209085409.1JeiU90UnCHk0iwW6Id9KnKsgCWHHWbE0ZeuEL0tvIM@z>

Hi Horatiu,

url:    https://github.com/intel-lab-lkp/linux/commits/Horatiu-Vultur/net-lan966x-Enable-PTP-on-bridge-interfaces/20221203-185009
patch link:    https://lore.kernel.org/r/20221203104348.1749811-2-horatiu.vultur%40microchip.com
patch subject: [PATCH net-next v3 1/4] net: microchip: vcap: Add vcap_get_rule
config: ia64-randconfig-m041-20221204
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:103 vcap_debugfs_show_rule_keyfield() error: uninitialized symbol 'value'.
drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:106 vcap_debugfs_show_rule_keyfield() error: uninitialized symbol 'mask'.

vim +/value +103 drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c

72d84dd609bea1 Steen Hegelund 2022-11-17   22  static void vcap_debugfs_show_rule_keyfield(struct vcap_control *vctrl,
72d84dd609bea1 Steen Hegelund 2022-11-17   23  					    struct vcap_output_print *out,
72d84dd609bea1 Steen Hegelund 2022-11-17   24  					    enum vcap_key_field key,
72d84dd609bea1 Steen Hegelund 2022-11-17   25  					    const struct vcap_field *keyfield,
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   26  					    struct vcap_client_keyfield_data *data)
72d84dd609bea1 Steen Hegelund 2022-11-17   27  {
72d84dd609bea1 Steen Hegelund 2022-11-17   28  	bool hex = false;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   29  	u8 *value, *mask;
72d84dd609bea1 Steen Hegelund 2022-11-17   30  	int idx, bytes;
72d84dd609bea1 Steen Hegelund 2022-11-17   31  
72d84dd609bea1 Steen Hegelund 2022-11-17   32  	out->prf(out->dst, "    %s: W%d: ", vcap_keyfield_name(vctrl, key),
72d84dd609bea1 Steen Hegelund 2022-11-17   33  		 keyfield[key].width);
72d84dd609bea1 Steen Hegelund 2022-11-17   34  
72d84dd609bea1 Steen Hegelund 2022-11-17   35  	switch (keyfield[key].type) {
72d84dd609bea1 Steen Hegelund 2022-11-17   36  	case VCAP_FIELD_BIT:
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   37  		out->prf(out->dst, "%d/%d", data->u1.value, data->u1.mask);
72d84dd609bea1 Steen Hegelund 2022-11-17   38  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   39  	case VCAP_FIELD_U32:
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   40  		value = (u8 *)(&data->u32.value);
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   41  		mask = (u8 *)(&data->u32.mask);
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   42  
72d84dd609bea1 Steen Hegelund 2022-11-17   43  		if (key == VCAP_KF_L3_IP4_SIP || key == VCAP_KF_L3_IP4_DIP) {
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   44  			out->prf(out->dst, "%pI4h/%pI4h", &data->u32.value,
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   45  				 &data->u32.mask);
72d84dd609bea1 Steen Hegelund 2022-11-17   46  		} else if (key == VCAP_KF_ETYPE ||
72d84dd609bea1 Steen Hegelund 2022-11-17   47  			   key == VCAP_KF_IF_IGR_PORT_MASK) {
72d84dd609bea1 Steen Hegelund 2022-11-17   48  			hex = true;
72d84dd609bea1 Steen Hegelund 2022-11-17   49  		} else {
72d84dd609bea1 Steen Hegelund 2022-11-17   50  			u32 fmsk = (1 << keyfield[key].width) - 1;
72d84dd609bea1 Steen Hegelund 2022-11-17   51  
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   52  			out->prf(out->dst, "%u/%u", data->u32.value & fmsk,
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   53  				 data->u32.mask & fmsk);
72d84dd609bea1 Steen Hegelund 2022-11-17   54  		}
72d84dd609bea1 Steen Hegelund 2022-11-17   55  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   56  	case VCAP_FIELD_U48:
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   57  		value = data->u48.value;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   58  		mask = data->u48.mask;
72d84dd609bea1 Steen Hegelund 2022-11-17   59  		if (key == VCAP_KF_L2_SMAC || key == VCAP_KF_L2_DMAC)
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   60  			out->prf(out->dst, "%pMR/%pMR", data->u48.value,
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   61  				 data->u48.mask);
72d84dd609bea1 Steen Hegelund 2022-11-17   62  		else
72d84dd609bea1 Steen Hegelund 2022-11-17   63  			hex = true;
72d84dd609bea1 Steen Hegelund 2022-11-17   64  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   65  	case VCAP_FIELD_U56:
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   66  		value = data->u56.value;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   67  		mask = data->u56.mask;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   68  		hex = true;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   69  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   70  	case VCAP_FIELD_U64:
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   71  		value = data->u64.value;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   72  		mask = data->u64.mask;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   73  		hex = true;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   74  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   75  	case VCAP_FIELD_U72:
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   76  		value = data->u72.value;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   77  		mask = data->u72.mask;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   78  		hex = true;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   79  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   80  	case VCAP_FIELD_U112:
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   81  		value = data->u112.value;
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   82  		mask = data->u112.mask;
72d84dd609bea1 Steen Hegelund 2022-11-17   83  		hex = true;
72d84dd609bea1 Steen Hegelund 2022-11-17   84  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   85  	case VCAP_FIELD_U128:
72d84dd609bea1 Steen Hegelund 2022-11-17   86  		if (key == VCAP_KF_L3_IP6_SIP || key == VCAP_KF_L3_IP6_DIP) {
72d84dd609bea1 Steen Hegelund 2022-11-17   87  			u8 nvalue[16], nmask[16];
72d84dd609bea1 Steen Hegelund 2022-11-17   88  
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   89  			vcap_netbytes_copy(nvalue, data->u128.value,
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   90  					   sizeof(nvalue));
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   91  			vcap_netbytes_copy(nmask, data->u128.mask,
0cdd42df7a2e90 Horatiu Vultur 2022-12-03   92  					   sizeof(nmask));
72d84dd609bea1 Steen Hegelund 2022-11-17   93  			out->prf(out->dst, "%pI6/%pI6", nvalue, nmask);
72d84dd609bea1 Steen Hegelund 2022-11-17   94  		} else {
72d84dd609bea1 Steen Hegelund 2022-11-17   95  			hex = true;

"hex" is true but "value" and "mask" are not initialized.

72d84dd609bea1 Steen Hegelund 2022-11-17   96  		}
72d84dd609bea1 Steen Hegelund 2022-11-17   97  		break;
72d84dd609bea1 Steen Hegelund 2022-11-17   98  	}
72d84dd609bea1 Steen Hegelund 2022-11-17   99  	if (hex) {
72d84dd609bea1 Steen Hegelund 2022-11-17  100  		bytes = DIV_ROUND_UP(keyfield[key].width, BITS_PER_BYTE);
72d84dd609bea1 Steen Hegelund 2022-11-17  101  		out->prf(out->dst, "0x");
72d84dd609bea1 Steen Hegelund 2022-11-17  102  		for (idx = 0; idx < bytes; ++idx)
72d84dd609bea1 Steen Hegelund 2022-11-17 @103  			out->prf(out->dst, "%02x", value[bytes - idx - 1]);
                                                                                           ^^^^^

72d84dd609bea1 Steen Hegelund 2022-11-17  104  		out->prf(out->dst, "/0x");
72d84dd609bea1 Steen Hegelund 2022-11-17  105  		for (idx = 0; idx < bytes; ++idx)
72d84dd609bea1 Steen Hegelund 2022-11-17 @106  			out->prf(out->dst, "%02x", mask[bytes - idx - 1]);
                                                                                           ^^^^
Warnings.


72d84dd609bea1 Steen Hegelund 2022-11-17  107  	}
72d84dd609bea1 Steen Hegelund 2022-11-17  108  	out->prf(out->dst, "\n");
72d84dd609bea1 Steen Hegelund 2022-11-17  109  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

