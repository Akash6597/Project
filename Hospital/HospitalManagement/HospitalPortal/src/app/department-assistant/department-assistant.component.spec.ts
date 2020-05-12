import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DepartmentAssistantComponent } from './department-assistant.component';

describe('DepartmentAssistantComponent', () => {
  let component: DepartmentAssistantComponent;
  let fixture: ComponentFixture<DepartmentAssistantComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DepartmentAssistantComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DepartmentAssistantComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
