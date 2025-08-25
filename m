Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255ED3A8F7
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756126844; cv=none; b=Ho4DSjB4WUcY1hM8nkSw4I44xf1A/KXSisZFQrYtNeX8IYBqh6v8oHjyRSwUF/CU91UepRqgZ8LZlTYXQNJMjmCm3Qs7daveQ1hJpyzCVHnHvMYJfIAw6b8B6lLYkkcqSIHBsGN9BIo568Uce4bxHX37/4b9uOxG6rHtTJGto84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756126844; c=relaxed/simple;
	bh=xf3DOQMVrG91iKbl7ipebCFVekmIKqtuQ81G7G/taU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HCEBvPEGse02JjENEUwSQyHvP7HE6j+rGx55Ul+r64WN7eZMqcezs8AnsDDKYYKBTiF/mg5hFJ4jnOzraJjoes3JArMs4HjFVhEKXieWyYzx0hUo8bJHeEykKxGBQE6ZIzlp3NC2bJAJrx2sMYRW/rmklCAr0hlNRrGG/ZVpRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aw8HLN0I; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aw8HLN0I"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso1010997f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756126840; x=1756731640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/0VK2T6V+Aj0ASKId11YflidkPTxQI3Y2JHVgkJXJUY=;
        b=aw8HLN0Ib8DgKqsSVNvIVxykQFJnzGPpCNNuvHdtQVxZ9hL8dNuTIwlzORmYmEMocz
         4Vzt4kJRivjQrZMYVnbxveWoINozTsryaWX8pbXdMn5LOi3t/wglsN62E86ArReXAx+l
         8ATP5HPi3lD1vbdDCbFeAlp/57NEGBVr+bnD6gYl6IKgc6gDabSg0OvBZurmWc+Mf7aX
         l4yfXxsfr7FSa+p9Vfwe6d9AkUnV12uwDXaIn/vTPOF1M75EL+aVw9vsVDiipOyKzCH4
         FLCe8VBo3xVaQmb5XMKOTDKBsFUFHO/8iJRa18SfumLvY3Wv7xVvB3kk1i6igftFLdat
         jGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126840; x=1756731640;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0VK2T6V+Aj0ASKId11YflidkPTxQI3Y2JHVgkJXJUY=;
        b=fkibV2vYZvUHeBOCnnlToPGlWqz5GU+S/ZsVNTLUIejb39eTv6Wd8itnSBgGaIzbG0
         +yH40qEaKuFNEyem0h8qcqOfhmo4+3yPoZ0AF1bcAojw+VSuxpi6ZFbDtrsBeseWGsXV
         gm4OOyaKKFWT7wIpxhErNG8WAhMjjS6XV0hMNs5ssxxwKcqcPtUXHVsqKS2UpdNMj9hH
         /8ABMbPMgN3MiOA+MN9vfKF30FWWHpKa6rHk1FUWfxAgknyUIKsYJgbVsBevOPi7d9/b
         RcM9hmkkX2YTl0OHQw5JY3Ef7EQDBiWAjc/q4yCudFVyIZYDTkPoDHM4JizhZm0Z1srA
         696A==
X-Gm-Message-State: AOJu0Yx9K63aULwbOQCQyjv5BOtoFQucNXRBi2Xekdi+YWDKMpdNqASM
	Ppt7Fqfj+3sJNtA14y37V8UIGKUpCyUdyBNMYdJfU4GMFI/fi+WUQP6TTuORum+lT9j9mG1ZjSM
	Ss+1a
X-Gm-Gg: ASbGncucUEnYb4zdfYG0HGVkZLSAeD94ZZhZVFYEBkL52wL0oaV1ut+yKh9NtuaFTsW
	CHzsPGlfG8GUVq1tOpnRi1T0g1ai0iHuMxyr9OxORmWUSqr8SWaM59OOhplu9jBWe4NKEplR4fa
	/Ej/tc++reJRvH2PuL7xfS4u9jFy+KXc1HInmy1P5ZvUaFNMvkNygF9KP1tBc8qsPNXmtwzpena
	4jRQFwJ4nOJteUZirD6QJxyMADOguScOfI3gKptrqr+stkqMxKOjnSqbHjTjTY06q+CtuWUxXnq
	i9oaiKfzTVJva+bpnPMpEOut7dahzv5AQ9tjJYdZPn7q93SGjNRDIQTUEe9Hr624+ViNpUiC2tE
	XObPtAtW2Lh792mNj5XIWKikDd642laXGtgebbg==
X-Google-Smtp-Source: AGHT+IFKESXASQM+VKjSbNLcCSsxhZD3d1Nqd+0rOXEx7HybgyHMMHJuEk3zwIeA8eDEbkWtc7wtdQ==
X-Received: by 2002:a05:6000:2dc2:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3c5daefc754mr9642267f8f.23.1756126839858;
        Mon, 25 Aug 2025 06:00:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7112129b9sm11538216f8f.34.2025.08.25.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 06:00:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 16:00:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Antoniu Miclaus <antoniu.miclaus@analog.com>,
	jic23@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: Re: [PATCH v5 4/6] iio: adc: add ade9000 support
Message-ID: <202508250158.KQ6WdkKh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822160157.5092-5-antoniu.miclaus@analog.com>
Message-ID: <20250825130035.VZuwnSt0vzwqTqFrxpArkSiw51M9uIs-TQESQ-YZ9kI@z>

Hi Antoniu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/iio-add-IIO_ALTCURRENT-channel-type/20250823-001017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250822160157.5092-5-antoniu.miclaus%40analog.com
patch subject: [PATCH v5 4/6] iio: adc: add ade9000 support
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250158.KQ6WdkKh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508250158.KQ6WdkKh-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ade9000.c:1009 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1505 ade9000_write_event_config() error: uninitialized symbol 'tmp'.
drivers/iio/adc/ade9000.c:1554 ade9000_write_event_config() error: uninitialized symbol 'interrupts'.

Old smatch warnings:
drivers/iio/adc/ade9000.c:1018 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1027 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1036 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1045 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1054 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20

vim +1009 drivers/iio/adc/ade9000.c

b695e630eecec70 Antoniu Miclaus 2025-08-22   998  		case ADE9000_ST1_ZXIC_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   999  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1000  				       IIO_UNMOD_EVENT_CODE(IIO_CURRENT,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1001  							    ADE9000_ST1_ZXIC_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1002  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1003  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1004  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1005  			handled_irq |= ADE9000_ST1_ZXIC_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1006  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1007  		case ADE9000_ST1_SWELLA_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1008  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22 @1009  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1010  							    ADE9000_ST1_SWELLA_BIT >> 20,

This is a kind of macro expansion bug:

include/linux/iio/events.h
    27  #define _IIO_EVENT_CODE(chan_type, diff, modifier, direction,           \
    28                          type, chan, chan1, chan2)                       \
    29          (((u64)type << 56) | ((u64)diff << 55) |                        \
    30           ((u64)direction << 48) | ((u64)modifier << 40) |               \
    31           ((u64)chan_type << 32) | (((u16)chan2) << 16) | ((u16)chan1) | \
    32           ((u16)chan))

There should be parenthese around "chan" on line 32.

	((u16)(chan)))

Otherwise it's a precendent bug and  we end up doing the cast before we
do the ">> 20".  Probably around the others as well?  Probably best if
someone tests this.


drivers/iio/adc/ade9000.c
  1425  static int ade9000_write_event_config(struct iio_dev *indio_dev,
  1426                                        const struct iio_chan_spec *chan,
  1427                                        enum iio_event_type type,
  1428                                        enum iio_event_direction dir,
  1429                                        bool state)
  1430  {
  1431          struct ade9000_state *st = iio_priv(indio_dev);
  1432          u32 interrupts, tmp;
  1433          int ret;
  1434  
  1435          /* Clear all pending events in STATUS1 register (write 1 to clear) */
  1436          ret = regmap_write(st->regmap, ADE9000_REG_STATUS1, GENMASK(31, 0));
  1437          if (ret)
  1438                  return ret;
  1439  
  1440          if (type == IIO_EV_TYPE_MAG) {
  1441                  ret = regmap_update_bits(st->regmap, ADE9000_REG_STATUS0,
  1442                                           ADE9000_ST0_EGYRDY, ADE9000_ST0_EGYRDY);
  1443                  if (ret)
  1444                          return ret;
  1445                  return regmap_update_bits(st->regmap, ADE9000_REG_MASK0,
  1446                                           ADE9000_ST0_EGYRDY,
  1447                                           state ? ADE9000_ST1_SEQERR_BIT : 0);
  1448          }
  1449  
  1450          if (type == IIO_EV_TYPE_CHANGE)
  1451                  return regmap_update_bits(st->regmap, ADE9000_REG_MASK1,
  1452                                           ADE9000_ST1_SEQERR_BIT,
  1453                                           state ? ADE9000_ST1_SEQERR_BIT : 0);
  1454  
  1455          if (dir == IIO_EV_DIR_EITHER) {
  1456                  static const struct {
  1457                          u32 irq;
  1458                          u32 wfb_trg;
  1459                  } trig_arr[6] = {
  1460                          {
  1461                                  .irq = ADE9000_ST1_ZXVA_BIT,
  1462                                  .wfb_trg = ADE9000_WFB_TRG_ZXVA_BIT
  1463                          }, {
  1464                                  .irq = ADE9000_ST1_ZXIA_BIT,
  1465                                  .wfb_trg = ADE9000_WFB_TRG_ZXIA_BIT
  1466                          }, {
  1467                                  .irq = ADE9000_ST1_ZXVB_BIT,
  1468                                  .wfb_trg = ADE9000_WFB_TRG_ZXVB_BIT
  1469                          }, {
  1470                                  .irq = ADE9000_ST1_ZXIB_BIT,
  1471                                  .wfb_trg = ADE9000_WFB_TRG_ZXIB_BIT
  1472                          }, {
  1473                                  .irq = ADE9000_ST1_ZXVC_BIT,
  1474                                  .wfb_trg = ADE9000_WFB_TRG_ZXVC_BIT
  1475                          }, {
  1476                                  .irq = ADE9000_ST1_ZXIC_BIT,
  1477                                  .wfb_trg = ADE9000_WFB_TRG_ZXIC_BIT
  1478                          },
  1479                  };
  1480                  if (state) {
  1481                          interrupts |= trig_arr[chan->channel * 2 + chan->type].irq;
  1482                          st->wfb_trg |= trig_arr[chan->channel * 2 + chan->type].wfb_trg;
  1483                  } else {
  1484                          interrupts &= ~trig_arr[chan->channel * 2 + chan->type].irq;
  1485                          st->wfb_trg &= ~trig_arr[chan->channel * 2 + chan->type].wfb_trg;
  1486                  }
  1487          }
  1488  
  1489          if (dir == IIO_EV_DIR_NONE) {
  1490                  switch (chan->channel) {
  1491                  case ADE9000_PHASE_A_NR:
  1492                          tmp |= ADE9000_ST1_ZXTOVA_BIT;

You can |= an uninitialized variable.

  1493                          break;
  1494                  case ADE9000_PHASE_B_NR:
  1495                          tmp |= ADE9000_ST1_ZXTOVB_BIT;
  1496                          break;
  1497                  case ADE9000_PHASE_C_NR:
  1498                          tmp |= ADE9000_ST1_ZXTOVC_BIT;
  1499                          break;
  1500                  default:
  1501                          break;
  1502                  }
  1503  
  1504                  if (state)
  1505                          interrupts |= tmp;

Same.

  1506                  else
  1507                          interrupts &= ~tmp;
  1508          } else if (dir == IIO_EV_DIR_RISING) {
  1509                  switch (chan->channel) {
  1510                  case ADE9000_PHASE_A_NR:
  1511                          tmp |= ADE9000_ST1_SWELLA_BIT;
  1512                          break;
  1513                  case ADE9000_PHASE_B_NR:
  1514                          tmp |= ADE9000_ST1_SWELLB_BIT;
  1515                          break;
  1516                  case ADE9000_PHASE_C_NR:
  1517                          tmp |= ADE9000_ST1_SWELLC_BIT;
  1518                          break;
  1519                  default:
  1520                          break;
  1521                  }
  1522  
  1523                  if (state) {
  1524                          interrupts |= tmp;
  1525                          st->wfb_trg |= ADE9000_WFB_TRG_SWELL_BIT;
  1526                  } else {
  1527                          interrupts &= ~tmp;
  1528                          st->wfb_trg &= ~ADE9000_WFB_TRG_SWELL_BIT;
  1529                  }
  1530          } else if (dir == IIO_EV_DIR_FALLING) {
  1531                  switch (chan->channel) {
  1532                  case ADE9000_PHASE_A_NR:
  1533                          tmp |= ADE9000_ST1_DIPA_BIT;
  1534                          break;
  1535                  case ADE9000_PHASE_B_NR:
  1536                          tmp |= ADE9000_ST1_DIPB_BIT;
  1537                          break;
  1538                  case ADE9000_PHASE_C_NR:
  1539                          tmp |= ADE9000_ST1_DIPC_BIT;
  1540                          break;
  1541                  default:
  1542                          break;
  1543                  }
  1544  
  1545                  if (state) {
  1546                          interrupts |= tmp;
  1547                          st->wfb_trg |= ADE9000_WFB_TRG_DIP_BIT;
  1548                  } else {
  1549                          interrupts &= ~tmp;
  1550                          st->wfb_trg &= ~ADE9000_WFB_TRG_DIP_BIT;
  1551                  }
  1552          }
  1553  
  1554          return regmap_update_bits(st->regmap, ADE9000_REG_MASK1, interrupts,
  1555                                    interrupts);
  1556  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

