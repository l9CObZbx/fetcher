/*
 * Copyright [2021-present] [ahoo wang <ahoowang@qq.com> (https://github.com/Ahoo-Wang)].
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *      http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import '@testing-library/jest-dom';
import { describe, expect, it } from 'vitest';
import { render } from '@testing-library/react';
import { Point } from '../../src/topbar/Point';

describe('Point', () => {
  describe('rendering', () => {
    it('should render a div element', () => {
      const { container } = render(<Point />);

      expect(container.querySelector('div')).toBeInTheDocument();
    });

    it('should have correct inline styles', () => {
      const { container } = render(<Point />);

      const div = container.querySelector('div');
      expect(div?.style.width).toBe('4px');
      expect(div?.style.height).toBe('4px');
      expect(div?.style.backgroundColor).toBe('rgb(217, 217, 217)');
      expect(div?.style.borderRadius).toBe('50%');
    });
  });
});
